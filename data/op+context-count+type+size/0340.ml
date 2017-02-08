
let rec clone x n =
  if n <= 0
  then []
  else (match x with | [] -> x | h::t -> (clone t (n - 1)) :: h);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(5,9)-(5,64)
(5,15)-(5,16)
(5,30)-(5,31)
(5,43)-(5,57)
(5,49)-(5,50)
(5,63)-(5,64)
*)

(* type error slice
(5,9)-(5,64)
(5,9)-(5,64)
(5,9)-(5,64)
(5,9)-(5,64)
(5,15)-(5,16)
(5,30)-(5,31)
(5,43)-(5,64)
(5,43)-(5,64)
(5,63)-(5,64)
*)
