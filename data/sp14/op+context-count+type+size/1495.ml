
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
(2,7)-(2,21)
(2,9)-(2,21)
(2,11)-(2,21)
(2,15)-(2,16)
(2,15)-(2,21)
(2,18)-(2,19)
(2,18)-(2,21)
(2,20)-(2,21)
(5,3)-(9,78)
(8,17)-(8,18)
(8,21)-(8,22)
(9,3)-(9,78)
(9,20)-(9,78)
(9,52)-(9,78)
*)

(* type error slice
(2,4)-(2,24)
(2,7)-(2,21)
(8,17)-(8,22)
(8,21)-(8,22)
*)
