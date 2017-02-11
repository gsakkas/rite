
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | h::t -> h + (sumList t) | [] -> 0;;

let rec inc i n = if n > 9 then inc (i + 1) sumList (digitsOfInt n) else i;;
