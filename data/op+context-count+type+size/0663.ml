
let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let (x,y) = ((n mod 10), (n / 10)) in
     if n < 10 then [n] else x @ (digitsOfInt y));;


(* fix

let rec append x y = match y with | [] -> [x] | h::t -> h :: (append x t);;

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let (x,y) = ((n mod 10), (n / 10)) in
     if n < 10 then [n] else append x (digitsOfInt y));;

*)

(* changed spans
(2,21)-(7,48)
(7,9)-(7,10)
(7,9)-(7,15)
(7,13)-(7,15)
(7,21)-(7,24)
(7,22)-(7,23)
(7,30)-(7,31)
(7,30)-(7,48)
(7,32)-(7,33)
(7,35)-(7,46)
(7,35)-(7,48)
(7,47)-(7,48)
*)

(* type error slice
(6,6)-(7,48)
(6,20)-(6,28)
(6,20)-(6,38)
(6,32)-(6,38)
(7,30)-(7,31)
(7,30)-(7,48)
(7,32)-(7,33)
*)
