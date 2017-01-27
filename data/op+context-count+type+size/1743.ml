
let rec listReverse l =
  match l with | [] -> [] | h::t -> t :: (listReverse h);;


(* fix

let rec listReverse l = match l with | [] -> [] | h::t -> t @ [h];;

*)

(* changed spans
(3,37)-(3,38)
(3,37)-(3,56)
(3,43)-(3,54)
(3,43)-(3,56)
*)

(* type error slice
(2,4)-(3,59)
(2,21)-(3,56)
(3,3)-(3,56)
(3,9)-(3,10)
(3,24)-(3,26)
(3,43)-(3,54)
(3,43)-(3,56)
(3,55)-(3,56)
*)
