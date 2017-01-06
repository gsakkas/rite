
let rec clone x n =
  if n <= 0
  then []
  else (match x with | [] -> x | h::t -> (clone h) :: (x (n - 1)));;



let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;


(* changed spans
(5,8)-(5,14)
(5,17)-(5,35)
(5,37)-(5,41)
(5,49)-(5,56)
(5,66)-(5,67)
*)

(* type error slice
(5,9)-(5,64)
(5,56)-(5,64)
*)
