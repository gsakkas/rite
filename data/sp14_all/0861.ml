
let listReverse l =
  let rec lr l' = function | [] -> l' | h::t -> lr (h :: l') t in lr [] l;;

let rec digitsOfInt n =
  let xxx =
    match n with
    | 0 -> []
    | n -> if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10)) in
  listReverse (xxx n);;


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
(7,5)-(9,70)
fun n ->
  match n with
  | 0 -> []
  | n -> if n < 0
         then []
         else (n mod 10) :: (digitsOfInt (n / 10))
LamG VarPatG (CaseG EmptyG (fromList [(VarPatG,Nothing,EmptyG),(LitPatG,Nothing,EmptyG)]))

*)

(* type error slice
(6,3)-(10,22)
(7,5)-(9,70)
(9,12)-(9,70)
(9,34)-(9,70)
(10,15)-(10,22)
(10,16)-(10,19)
*)
