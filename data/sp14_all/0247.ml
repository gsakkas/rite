
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
(7,30)-(7,49)
append x (digitsOfInt y)
AppG [VarG,AppG [EmptyG]]

*)

(* type error slice
(6,5)-(7,50)
(6,18)-(6,40)
(6,19)-(6,29)
(7,30)-(7,31)
(7,30)-(7,49)
(7,32)-(7,33)
*)
