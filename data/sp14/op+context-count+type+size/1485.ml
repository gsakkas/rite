
let rec listReverse l =
  match l with | [] -> [] | t::h::[] -> h :: (listReverse t);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | _::h::[] -> h :: (listReverse []);;

*)

(* changed spans
(3,3)-(3,60)
(3,59)-(3,60)
*)

(* type error slice
(2,4)-(3,63)
(2,21)-(3,60)
(3,3)-(3,60)
(3,3)-(3,60)
(3,9)-(3,10)
(3,47)-(3,58)
(3,47)-(3,60)
(3,59)-(3,60)
*)
