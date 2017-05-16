
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  let sum = 0 in
  if n < 10 then n + sum else sum = (digitalRoot (sumList (digitsOfInt n)));;
