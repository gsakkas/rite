
let rec digitsOfInt n =
  let ns = [] in
  match n with
  | 0 -> ns
  | n -> if n > 0 then (n mod 10) :: (digitsOfInt (n / 10)) else [];;

let _ = digitsOfInt - 5;;
