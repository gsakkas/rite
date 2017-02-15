
let rec listReverse l =
  match l with | [] -> [] | t::h::[] -> [h; listReverse t];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | _::h::[] -> h :: (listReverse []);;

*)

(* changed spans
(3,2)-(3,58)
(3,40)-(3,58)
(3,56)-(3,57)
*)

(* type error slice
(2,3)-(3,60)
(2,20)-(3,58)
(3,2)-(3,58)
(3,40)-(3,58)
(3,40)-(3,58)
(3,44)-(3,55)
(3,44)-(3,57)
*)
