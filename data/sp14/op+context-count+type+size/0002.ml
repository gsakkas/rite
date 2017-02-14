
let rec listReverse l =
  match l with
  | [] -> []
  | hd::tl -> if hd != [] then (listReverse tl) :: hd else hd;;


(* fix

let rec listReverse l = match l with | [] -> [] | _::tl -> listReverse tl;;

*)

(* changed spans
(3,2)-(5,61)
(5,14)-(5,61)
(5,17)-(5,19)
(5,17)-(5,25)
(5,23)-(5,25)
(5,31)-(5,53)
(5,59)-(5,61)
*)

(* type error slice
(2,3)-(5,63)
(2,20)-(5,61)
(3,2)-(5,61)
(5,14)-(5,61)
(5,31)-(5,47)
(5,31)-(5,53)
(5,31)-(5,53)
(5,32)-(5,43)
*)
