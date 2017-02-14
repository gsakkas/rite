
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
(16,16)-(16,17)
(16,16)-(16,72)
(16,22)-(16,32)
(16,22)-(16,72)
(17,15)-(17,16)
(17,15)-(17,20)
(18,29)-(18,76)
*)

(* type error slice
(16,3)-(18,76)
(16,9)-(16,72)
(16,11)-(16,72)
(16,16)-(16,72)
(16,51)-(16,62)
(16,51)-(16,64)
(16,63)-(16,64)
(18,43)-(18,57)
(18,43)-(18,69)
(18,58)-(18,59)
*)
