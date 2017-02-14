
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
(2,20)-(7,49)
(6,4)-(7,49)
(7,8)-(7,9)
(7,8)-(7,14)
(7,12)-(7,14)
(7,20)-(7,23)
(7,21)-(7,22)
(7,29)-(7,30)
(7,29)-(7,48)
(7,31)-(7,32)
(7,33)-(7,48)
(7,34)-(7,45)
(7,46)-(7,47)
*)

(* type error slice
(6,4)-(7,49)
(6,17)-(6,39)
(6,18)-(6,28)
(7,29)-(7,30)
(7,29)-(7,48)
(7,31)-(7,32)
*)
