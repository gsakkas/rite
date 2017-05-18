
let rec digitsOfInt n =
  let digit = n mod 10
  and r = n / 10 in if n <= 0 then [] else (digitsOfInt r) @ [digit];;

let digits n = digitsOfInt (abs n);;

let rec sumOfDigits n = match n with | [] -> 0 | h::t -> h + (sumOfDigits t);;

let _ = sumOfDigits digits 9876;;
