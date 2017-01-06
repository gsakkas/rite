
let rec digits (x,y) =
  if y < 10 then y :: x else digits (((y mod 10) :: x), (y mod 10));;

let rec digitsOfInt n = if n <= 0 then [] else digits ([], n);;

let digits n = digitsOfInt (abs n);;

let rec digitsOfInt n = if n <= 0 then [] else digits ([], n);;



let rec digits (x,y) =
  if y < 10 then y :: x else digits (((y mod 10) :: x), (y / 10));;

let rec digitsOfInt n = if n <= 0 then [] else digits ([], n);;


(* changed spans
(3,60)-(3,63)
(7,1)-(9,64)
*)

(* type error slice
(9,48)-(9,61)
*)
