
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let additivePersistence n =
  let count = 0 in
  if n < 10 then count else ((sumList (digitsOfInt n)), (count + 1));;
