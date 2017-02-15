
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
