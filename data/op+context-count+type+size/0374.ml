
let rec clone x n =
  if n <= 0
  then []
  else (match x with | [] -> x | h::t -> [clone t (n - 1); h]);;



let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;


(* changed spans
(5,8)-(5,14)
(5,17)-(5,35)
(5,37)-(5,43)
(5,49)-(5,50)
(5,58)-(5,62)
*)

(* type error slice
(5,43)-(5,57)
*)
