
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
(7,5)-(9,68)
(10,3)-(10,7)
(10,3)-(10,21)
(10,20)-(10,21)
*)

(* type error slice
(2,4)-(3,76)
(2,17)-(3,74)
(3,3)-(3,74)
(3,19)-(3,63)
(3,49)-(3,51)
(3,49)-(3,63)
(3,53)-(3,60)
(3,62)-(3,63)
(3,67)-(3,69)
(3,67)-(3,74)
(3,70)-(3,72)
(3,73)-(3,74)
(6,3)-(10,21)
(7,5)-(9,68)
(7,11)-(7,12)
(8,12)-(8,14)
(10,3)-(10,7)
(10,3)-(10,21)
(10,8)-(10,19)
(10,20)-(10,21)
*)
