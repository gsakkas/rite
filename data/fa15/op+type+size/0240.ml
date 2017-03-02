
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec digitalRoot n =
  let nList = digitsOfInt n in
  match nList with
  | [] -> 0
  | nList -> let sumOfN = sumList n in sumOfN + (digitalRoot sumOfN);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec digitalRoot n =
  let nList = digitsOfInt n in
  match nList with
  | [] -> 0
  | nList -> let sumOfN = sumList nList in sumOfN + (digitalRoot sumOfN);;

*)

(* changed spans
(11,34)-(11,35)
*)

(* type error slice
(3,25)-(3,47)
(3,26)-(3,37)
(3,38)-(3,46)
(5,21)-(5,74)
(5,21)-(5,74)
(5,62)-(5,74)
(5,63)-(5,70)
(5,71)-(5,73)
(8,14)-(8,25)
(8,14)-(8,27)
(8,26)-(8,27)
(11,26)-(11,33)
(11,26)-(11,35)
(11,34)-(11,35)
*)

(* all spans
(2,20)-(3,60)
(3,2)-(3,60)
(3,5)-(3,11)
(3,5)-(3,6)
(3,10)-(3,11)
(3,17)-(3,19)
(3,25)-(3,60)
(3,48)-(3,49)
(3,25)-(3,47)
(3,26)-(3,37)
(3,38)-(3,46)
(3,39)-(3,40)
(3,43)-(3,45)
(3,50)-(3,60)
(3,51)-(3,59)
(3,51)-(3,52)
(3,57)-(3,59)
(5,16)-(5,74)
(5,21)-(5,74)
(5,27)-(5,29)
(5,43)-(5,44)
(5,57)-(5,74)
(5,57)-(5,59)
(5,62)-(5,74)
(5,63)-(5,70)
(5,71)-(5,73)
(7,20)-(11,68)
(8,2)-(11,68)
(8,14)-(8,27)
(8,14)-(8,25)
(8,26)-(8,27)
(9,2)-(11,68)
(9,8)-(9,13)
(10,10)-(10,11)
(11,13)-(11,68)
(11,26)-(11,35)
(11,26)-(11,33)
(11,34)-(11,35)
(11,39)-(11,68)
(11,39)-(11,45)
(11,48)-(11,68)
(11,49)-(11,60)
(11,61)-(11,67)
*)
