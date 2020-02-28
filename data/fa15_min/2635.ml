
let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec mulByDigit i l =
  let f a x =
    let y = i * x in
    match a with
    | h::t -> ((h + y) / 10) :: ((h + y) mod 10) :: t
    | _ -> [y / 10; y mod 10] in
  let base = [] in removeZero (List.fold_left f base (List.rev l));;

let bigMul l1 l2 =
  let f a x = ((mulByDigit x l1) @ (clone 0 (List.length a))) :: a in
  let base = (0, []) in
  let args = List.rev l2 in
  let (carry,res) = List.fold_left f base args in carry :: res;;


(* fix

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec mulByDigit i l =
  let f a x =
    let y = i * x in
    match a with
    | h::t -> ((h + y) / 10) :: ((h + y) mod 10) :: t
    | _ -> [y / 10; y mod 10] in
  let base = [] in removeZero (List.fold_left f base (List.rev l));;

let bigMul l1 l2 =
  let f a x = ((mulByDigit x l1) @ (clone 0 (List.length a))) @ a in
  let base = [] in
  let args = List.rev l2 in let res = List.fold_left f base args in res;;

*)

(* changed spans
(16,15)-(16,67)
(mulByDigit x l1 @ clone 0
                         (List.length a)) @ a
AppG [AppG [EmptyG,EmptyG],VarG]

(17,14)-(17,21)
[]
ListG []

(19,3)-(19,63)
let res =
  List.fold_left f base args in
res
LetG NonRec [(VarPatG,AppG [EmptyG,EmptyG,EmptyG])] VarG

*)

(* type error slice
(16,3)-(19,63)
(16,9)-(16,67)
(16,45)-(16,60)
(16,46)-(16,57)
(16,58)-(16,59)
(17,3)-(19,63)
(17,14)-(17,21)
(19,21)-(19,35)
(19,21)-(19,47)
(19,36)-(19,37)
(19,38)-(19,42)
*)
