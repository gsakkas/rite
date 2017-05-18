
let listReverse l =
  let rec lr l' = function | [] -> l' | h::t -> lr (h :: l') t in lr [] l;;

let rec digitsOfInt n =
  let this = listReverse n in
  match n with
  | 0 -> []
  | n -> if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;
