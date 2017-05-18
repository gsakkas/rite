
let append x l = match l with | [] -> [x] | h::t -> x :: l;;

let rec digitsOfInt n =
  if n <= 0 then [] else append (digitsOfInt (n / 10)) [n mod 10];;
