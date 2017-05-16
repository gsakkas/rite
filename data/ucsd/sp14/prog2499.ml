
let listReverse l =
  let rec lr l' = function | [] -> l' | h::t -> lr (h :: l') t in lr [] l;;

let rec digitsOfInt n =
  let ns = [] in
  match n with
  | h::t -> listReverse ns
  | 0 -> ns
  | n -> if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;
