
let rec listReverse l =
  match l with | [] -> [] | x::[] -> x | hd::tl -> (listReverse tl) :: hd;;


(* fix

let rec last l = match l with | x::[] -> x | hd::tl -> last tl | [] -> [];;

let rec removeLast l =
  match l with | x::[] -> [] | hd::tl -> hd :: (removeLast tl) | [] -> [];;

let rec listReverse l = (last l) :: (listReverse (removeLast l));;

*)

(* changed spans
(3,3)-(3,74)
(last l) :: (listReverse (removeLast l))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(3,76)
(2,21)-(3,74)
(3,3)-(3,74)
(3,38)-(3,39)
(3,52)-(3,68)
(3,52)-(3,74)
(3,53)-(3,64)
(3,72)-(3,74)
*)
