
let rec digitsOfInt n =
  let return = [n mod 10] in
  if (n / 10) <> 0
  then ((n mod 10) :: return; (digitsOfInt (n / 10)) @ return)
  else return;;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n = sumList digitsOfInt n;;


(* fix

let rec digitsOfInt n =
  let return = [n mod 10] in
  if (n / 10) <> 0
  then ((n mod 10) :: return; (digitsOfInt (n / 10)) @ return)
  else return;;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n = let digits = digitsOfInt n in sumList digits;;

*)

(* changed spans
(10,32)-(10,39)
(10,32)-(10,53)
(10,40)-(10,51)
*)

(* type error slice
(5,7)-(5,62)
(5,8)-(5,28)
(8,55)-(8,70)
(8,59)-(8,70)
(8,60)-(8,67)
(10,32)-(10,39)
(10,32)-(10,53)
*)

(* all spans
(2,20)-(6,13)
(3,2)-(6,13)
(3,15)-(3,25)
(3,16)-(3,24)
(3,16)-(3,17)
(3,22)-(3,24)
(4,2)-(6,13)
(4,5)-(4,18)
(4,5)-(4,13)
(4,6)-(4,7)
(4,10)-(4,12)
(4,17)-(4,18)
(5,7)-(5,62)
(5,8)-(5,28)
(5,8)-(5,18)
(5,9)-(5,10)
(5,15)-(5,17)
(5,22)-(5,28)
(5,30)-(5,61)
(5,53)-(5,54)
(5,30)-(5,52)
(5,31)-(5,42)
(5,43)-(5,51)
(5,44)-(5,45)
(5,48)-(5,50)
(5,55)-(5,61)
(6,7)-(6,13)
(8,16)-(8,70)
(8,21)-(8,70)
(8,27)-(8,29)
(8,43)-(8,44)
(8,55)-(8,70)
(8,55)-(8,56)
(8,59)-(8,70)
(8,60)-(8,67)
(8,68)-(8,69)
(10,28)-(10,53)
(10,32)-(10,53)
(10,32)-(10,39)
(10,40)-(10,51)
(10,52)-(10,53)
*)
