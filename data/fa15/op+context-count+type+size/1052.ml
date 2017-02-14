
let rec clone x n =
  if n > 0 then match x with | h::t -> h @ (clone t (n - 1));;


(* fix

let rec clone x n = if n = 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(3,2)-(3,60)
(3,5)-(3,10)
(3,16)-(3,60)
(3,22)-(3,23)
(3,39)-(3,40)
(3,41)-(3,42)
(3,43)-(3,60)
(3,50)-(3,51)
*)

(* type error slice
(3,2)-(3,60)
(3,2)-(3,60)
(3,2)-(3,60)
(3,16)-(3,60)
(3,39)-(3,60)
(3,41)-(3,42)
*)
