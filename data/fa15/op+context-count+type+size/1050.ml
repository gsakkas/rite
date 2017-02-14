
let rec clone x n =
  if n > 0 then match x with | h::t -> [h] :: (clone t (n - 1));;


(* fix

let rec clone x n = if n = 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(3,3)-(3,62)
(3,6)-(3,11)
(3,17)-(3,62)
(3,23)-(3,24)
(3,40)-(3,43)
(3,41)-(3,42)
(3,54)-(3,55)
*)

(* type error slice
(3,3)-(3,62)
(3,3)-(3,62)
(3,3)-(3,62)
(3,17)-(3,62)
(3,40)-(3,62)
*)
