
let rec digitsOfInt n =
  let ns = [] in
  match n with
  | 0 -> ns
  | n -> if n < 0 then [] else [(n mod 10) :: (digitsOfInt (n / 10))];;
