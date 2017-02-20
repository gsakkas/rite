
let listReverse l =
  let rec lr l' = function | [] -> l' | h::t -> lr (h :: l') t in lr [] l;;

let rec digitsOfInt n =
  let this =
    match n with
    | 0 -> []
    | n -> if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10)) in
  this listReverse n;;


(* fix

let listReverse l =
  let rec lr l' = function | [] -> l' | h::t -> lr (h :: l') t in lr [] l;;

let rec digitsOfInt n =
  let xxx n =
    match n with
    | 0 -> []
    | n -> if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10)) in
  listReverse (xxx n);;

*)

(* changed spans
(6,2)-(10,20)
(7,4)-(9,69)
(10,2)-(10,6)
(10,2)-(10,20)
(10,19)-(10,20)
*)

(* type error slice
(6,2)-(10,20)
(7,4)-(9,69)
(9,11)-(9,69)
(9,33)-(9,69)
(10,2)-(10,6)
(10,2)-(10,20)
*)

(* all spans
(2,16)-(3,73)
(3,2)-(3,73)
(3,13)-(3,62)
(3,18)-(3,62)
(3,18)-(3,62)
(3,18)-(3,62)
(3,35)-(3,37)
(3,48)-(3,62)
(3,48)-(3,50)
(3,51)-(3,60)
(3,52)-(3,53)
(3,57)-(3,59)
(3,61)-(3,62)
(3,66)-(3,73)
(3,66)-(3,68)
(3,69)-(3,71)
(3,72)-(3,73)
(5,20)-(10,20)
(6,2)-(10,20)
(7,4)-(9,69)
(7,10)-(7,11)
(8,11)-(8,13)
(9,11)-(9,69)
(9,14)-(9,19)
(9,14)-(9,15)
(9,18)-(9,19)
(9,25)-(9,27)
(9,33)-(9,69)
(9,33)-(9,43)
(9,34)-(9,35)
(9,40)-(9,42)
(9,47)-(9,69)
(9,48)-(9,59)
(9,60)-(9,68)
(9,61)-(9,62)
(9,65)-(9,67)
(10,2)-(10,20)
(10,2)-(10,6)
(10,7)-(10,18)
(10,19)-(10,20)
*)
