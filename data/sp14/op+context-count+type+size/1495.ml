
let y f g x = f (g x);;

let rec mulByDigit i l =
  let f a x =
    match a with
    | [] -> (i * x) :: a
    | h::t -> [(x * y) + (h / 10); h mod 10] @ t in
  let base = [] in let args = List.rev (0 :: l) in List.fold_left f base args;;


(* fix

let rec mulByDigit i l =
  let f a x =
    match a with
    | [] -> (i * x) :: a
    | h::t -> [(i * x) + (h / 10); h mod 10] @ t in
  let base = [] in let args = List.rev (0 :: l) in List.fold_left f base args;;

*)

(* changed spans
(2,6)-(2,21)
(2,8)-(2,21)
(2,10)-(2,21)
(2,14)-(2,15)
(2,14)-(2,21)
(2,16)-(2,21)
(2,17)-(2,18)
(2,19)-(2,20)
(5,2)-(9,77)
(8,16)-(8,17)
(8,20)-(8,21)
(9,2)-(9,77)
(9,19)-(9,77)
(9,51)-(9,77)
*)

(* type error slice
(2,3)-(2,23)
(2,6)-(2,21)
(8,15)-(8,22)
(8,20)-(8,21)
*)
