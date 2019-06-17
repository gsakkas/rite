
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
  let f a x = (0, (((mulByDigit x l1) @ (clone 0 (List.length a))) :: a)) in
  let base = (0, []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;


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
(16,15)-(16,74)
(mulByDigit x l1 @ clone 0
                         (List.length a)) @ a
AppG [AppG [EmptyG,EmptyG],VarG]

(17,14)-(17,21)
[]
ListG []

(18,29)-(18,76)
let res =
  List.fold_left f base args in
res
LetG NonRec [(VarPatG,AppG [EmptyG,EmptyG,EmptyG])] VarG

*)

(* type error slice
(16,3)-(18,76)
(16,9)-(16,74)
(16,11)-(16,74)
(16,15)-(16,74)
(16,50)-(16,65)
(16,51)-(16,62)
(16,63)-(16,64)
(18,43)-(18,57)
(18,43)-(18,69)
(18,58)-(18,59)
*)
