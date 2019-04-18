
let rec listReverse l =
  match l with | x::[] -> x | hd::tl -> (listReverse tl) :: hd;;


(* fix

let rec last l = match l with | x::[] -> x | hd::tl -> last tl | [] -> [];;

let rec removeLast l =
  match l with | x::[] -> [] | hd::tl -> hd :: (removeLast tl) | [] -> [];;

let rec listReverse l = (last l) :: (listReverse (removeLast l));;

*)

(* changed spans
(3,3)-(3,63)
(last l) :: (listReverse (removeLast l))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(3,65)
(2,21)-(3,63)
(3,3)-(3,63)
(3,27)-(3,28)
(3,41)-(3,57)
(3,41)-(3,63)
(3,42)-(3,53)
(3,61)-(3,63)
*)
