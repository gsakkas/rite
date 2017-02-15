
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
(16,14)-(16,66)
(16,16)-(16,26)
(17,13)-(17,20)
(17,14)-(17,15)
(19,2)-(19,62)
(19,50)-(19,62)
*)

(* type error slice
(16,2)-(19,62)
(16,8)-(16,66)
(16,44)-(16,59)
(16,45)-(16,56)
(16,57)-(16,58)
(17,2)-(19,62)
(17,13)-(17,20)
(19,20)-(19,34)
(19,20)-(19,46)
(19,35)-(19,36)
(19,37)-(19,41)
*)
