
let rec digitsOfInt n =
  if n <= 0
  then []
  else
    (let next_tail = digitsOfInt (n / 10) in
     match next_tail with | x::xs -> xs @ [x :: (n mod 10)]);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(6,6)-(7,60)
(6,22)-(6,41)
(7,6)-(7,60)
(7,12)-(7,21)
(7,38)-(7,40)
(7,38)-(7,60)
(7,41)-(7,42)
*)

(* type error slice
(7,6)-(7,60)
(7,6)-(7,60)
(7,38)-(7,40)
(7,38)-(7,60)
(7,41)-(7,42)
(7,43)-(7,60)
(7,43)-(7,60)
(7,44)-(7,45)
(7,44)-(7,58)
(7,44)-(7,58)
(7,44)-(7,58)
(7,50)-(7,58)
*)
