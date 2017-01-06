
let rec digitsOfInt n =
  if n <= 0
  then []
  else
    (let next_tail = digitsOfInt (n / 10) in
     match next_tail with | x::xs -> xs @ [x :: (n mod 10)]);;



let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;


(* changed spans
(6,6)-(6,21)
(6,43)-(7,40)
(7,44)-(7,50)
(7,58)-(7,59)
(7,60)-(7,61)
*)

(* type error slice
(7,44)-(7,58)
*)
