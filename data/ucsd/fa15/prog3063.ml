
let rec append l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (append t l2);;

let rec digitsOfInt n =
  if n > 0 then append (digitsOfInt (n / 10)) [n mod 10] else [];;

let _ = digitsOfInt - 1;;
