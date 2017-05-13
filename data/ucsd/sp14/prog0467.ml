
let rec digitsOfInt n =
  match n with
  | 0 -> []
  | n -> if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

let listReverse l =
  let rec lr l' = function | [] -> l' | h::t -> lr (h :: l') t in lr [] l;;

let digitsOfInt n =
  let xxx =
    match n with
    | 0 -> []
    | n -> if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10)) in
  listReverse (xxx n);;
