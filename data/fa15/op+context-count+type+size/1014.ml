
let modulus ss = ss mod 10;;

let rec digitsOfInt n =
  if n <= 0
  then []
  else (match n with | x -> (digitsOfInt (n / 10)) @ [modulus x]);;

let lt10 q = q < 10;;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if lt10 n
  then n
  else
    (match n with
     | n -> let x_ = digitsOfInt n in sumList x_ additivePersistence n);;


(* fix

let modulus ss = ss mod 10;;

let rec digitsOfInt n =
  if n <= 0
  then []
  else (match n with | x -> (digitsOfInt (n / 10)) @ [modulus x]);;

let lt10 q = q < 10;;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if lt10 n
  then n
  else
    (match n with
     | n ->
         let n1 = let x0 = digitsOfInt n in sumList x0 in
         additivePersistence n1);;

*)

(* changed spans
(18,12)-(18,70)
(18,21)-(18,34)
(18,38)-(18,70)
(18,46)-(18,48)
(18,49)-(18,68)
(18,69)-(18,70)
*)

(* type error slice
(11,55)-(11,70)
(11,59)-(11,70)
(11,60)-(11,67)
(18,38)-(18,45)
(18,38)-(18,70)
*)

(* all spans
(2,12)-(2,26)
(2,17)-(2,26)
(2,17)-(2,19)
(2,24)-(2,26)
(4,20)-(7,65)
(5,2)-(7,65)
(5,5)-(5,11)
(5,5)-(5,6)
(5,10)-(5,11)
(6,7)-(6,9)
(7,7)-(7,65)
(7,14)-(7,15)
(7,28)-(7,64)
(7,51)-(7,52)
(7,28)-(7,50)
(7,29)-(7,40)
(7,41)-(7,49)
(7,42)-(7,43)
(7,46)-(7,48)
(7,53)-(7,64)
(7,54)-(7,63)
(7,54)-(7,61)
(7,62)-(7,63)
(9,9)-(9,19)
(9,13)-(9,19)
(9,13)-(9,14)
(9,17)-(9,19)
(11,16)-(11,70)
(11,21)-(11,70)
(11,27)-(11,29)
(11,43)-(11,44)
(11,55)-(11,70)
(11,55)-(11,56)
(11,59)-(11,70)
(11,60)-(11,67)
(11,68)-(11,69)
(13,28)-(18,71)
(14,2)-(18,71)
(14,5)-(14,11)
(14,5)-(14,9)
(14,10)-(14,11)
(15,7)-(15,8)
(17,4)-(18,71)
(17,11)-(17,12)
(18,12)-(18,70)
(18,21)-(18,34)
(18,21)-(18,32)
(18,33)-(18,34)
(18,38)-(18,70)
(18,38)-(18,45)
(18,46)-(18,48)
(18,49)-(18,68)
(18,69)-(18,70)
*)
