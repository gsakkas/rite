
let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  if n < 10 then n else (let summed = sumList n in digitalRoot summed);;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else
    (let modded = n mod 10 in
     let quotient = n / 10 in
     let head = digitsOfInt quotient in head @ [modded]);;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  if n < 10
  then n
  else
    (let intList = digits n in let sum = sumList intList in digitalRoot sum);;

*)

(* changed spans
(2,16)-(2,70)
(5,24)-(5,70)
(5,38)-(5,45)
(5,51)-(5,62)
(5,51)-(5,69)
(5,63)-(5,69)
*)

(* type error slice
(2,21)-(2,70)
(2,59)-(2,70)
(2,60)-(2,67)
(2,68)-(2,69)
(5,5)-(5,6)
(5,5)-(5,11)
(5,9)-(5,11)
(5,38)-(5,45)
(5,38)-(5,47)
(5,46)-(5,47)
*)

(* all spans
(2,16)-(2,70)
(2,21)-(2,70)
(2,27)-(2,29)
(2,43)-(2,44)
(2,55)-(2,70)
(2,55)-(2,56)
(2,59)-(2,70)
(2,60)-(2,67)
(2,68)-(2,69)
(4,20)-(5,70)
(5,2)-(5,70)
(5,5)-(5,11)
(5,5)-(5,6)
(5,9)-(5,11)
(5,17)-(5,18)
(5,24)-(5,70)
(5,38)-(5,47)
(5,38)-(5,45)
(5,46)-(5,47)
(5,51)-(5,69)
(5,51)-(5,62)
(5,63)-(5,69)
*)
