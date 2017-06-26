
let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec additivePersistence n =
  if n < 10 then 0 else 1 + (additivePersistence (sumList n));;


(* fix

let rec append xs1 xs2 =
  match xs1 with | [] -> xs2 | hd::tl -> hd :: (append tl xs2);;

let rec digitsOfInt n =
  if n <= 0 then [] else append (digitsOfInt (n / 10)) [n - ((n / 10) * 10)];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec additivePersistence n =
  if n < 10 then 0 else 1 + (additivePersistence (sumList (digits n)));;

*)

(* changed spans
(2,16)-(2,74)
(5,58)-(5,59)
*)

(* type error slice
(2,21)-(2,74)
(2,62)-(2,74)
(2,63)-(2,70)
(2,71)-(2,73)
(5,5)-(5,6)
(5,5)-(5,11)
(5,9)-(5,11)
(5,49)-(5,60)
(5,50)-(5,57)
(5,58)-(5,59)
*)

(* all spans
(2,16)-(2,74)
(2,21)-(2,74)
(2,27)-(2,29)
(2,43)-(2,44)
(2,57)-(2,74)
(2,57)-(2,59)
(2,62)-(2,74)
(2,63)-(2,70)
(2,71)-(2,73)
(4,28)-(5,61)
(5,2)-(5,61)
(5,5)-(5,11)
(5,5)-(5,6)
(5,9)-(5,11)
(5,17)-(5,18)
(5,24)-(5,61)
(5,24)-(5,25)
(5,28)-(5,61)
(5,29)-(5,48)
(5,49)-(5,60)
(5,50)-(5,57)
(5,58)-(5,59)
*)
