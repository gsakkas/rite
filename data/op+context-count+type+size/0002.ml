
let rec listReverse l =
  match l with
  | [] -> []
  | hd::tl -> if hd != [] then (listReverse tl) :: hd else hd;;


(* fix

let rec listReverse l = match l with | [] -> [] | _::tl -> listReverse tl;;

*)

(* changed spans
(3,3)-(5,62)
(5,15)-(5,62)
(5,18)-(5,20)
(5,18)-(5,26)
(5,24)-(5,26)
(5,33)-(5,54)
(5,60)-(5,62)
*)

(* type error slice
(2,4)-(5,64)
(2,21)-(5,62)
(3,3)-(5,62)
(5,15)-(5,62)
(5,33)-(5,44)
(5,33)-(5,47)
(5,33)-(5,54)
(5,33)-(5,54)
*)
