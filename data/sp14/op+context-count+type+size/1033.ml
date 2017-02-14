
let rec listReverse l =
  match l with | [] -> [] | hd::l' -> 1 + (listReverse l');;


(* fix

let rec listReverse l = match l with | [] -> [] | _::tl -> listReverse tl;;

*)

(* changed spans
(3,2)-(3,58)
(3,38)-(3,39)
(3,38)-(3,58)
(3,55)-(3,57)
*)

(* type error slice
(2,3)-(3,60)
(2,20)-(3,58)
(3,2)-(3,58)
(3,2)-(3,58)
(3,23)-(3,25)
(3,38)-(3,58)
(3,38)-(3,58)
(3,42)-(3,58)
(3,43)-(3,54)
*)
