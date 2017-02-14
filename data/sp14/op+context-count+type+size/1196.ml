
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
(6,3)-(10,21)
(7,5)-(9,68)
(10,3)-(10,7)
(10,3)-(10,21)
(10,20)-(10,21)
*)

(* type error slice
(6,3)-(10,21)
(7,5)-(9,68)
(9,12)-(9,68)
(9,35)-(9,68)
(10,3)-(10,7)
(10,3)-(10,21)
*)
