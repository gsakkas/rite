
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
  let f a x = (a, ((mulByDigit x l1) @ (clone 0 (List.length a)))) in
  let base = ([], []) in
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
  let f a x =
    let (a1,a2) = a in (a1, ((mulByDigit x l1) @ (clone 0 (List.length a1)))) in
  let base = ([], []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(16,14)-(16,66)
(16,18)-(16,65)
(16,61)-(16,62)
(17,2)-(18,75)
(17,13)-(17,21)
(18,2)-(18,75)
(18,28)-(18,75)
*)

(* type error slice
(16,2)-(18,75)
(16,8)-(16,66)
(16,10)-(16,66)
(16,14)-(16,66)
(16,48)-(16,63)
(16,49)-(16,60)
(16,61)-(16,62)
(18,42)-(18,56)
(18,42)-(18,68)
(18,57)-(18,58)
*)
