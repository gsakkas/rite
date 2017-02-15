
let rec clone x n =
  if n <= 0
  then []
  else (match x with | [] -> x | h::t -> (clone t (n - 1)) :: h);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(5,7)-(5,64)
(5,14)-(5,15)
(5,29)-(5,30)
(5,41)-(5,58)
(5,48)-(5,49)
(5,62)-(5,63)
*)

(* type error slice
(5,7)-(5,64)
(5,7)-(5,64)
(5,7)-(5,64)
(5,7)-(5,64)
(5,14)-(5,15)
(5,29)-(5,30)
(5,41)-(5,63)
(5,41)-(5,63)
(5,62)-(5,63)
*)
