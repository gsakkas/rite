
let rec helperAppend l n =
  match l with | [] -> n | h::t -> h :: (helperAppend t n);;

let rec digitsOfInt n =
  if n <= 0 then [] else helperAppend (digitsOfInt (n / 10)) [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n <= 0 then [] else sumList (digitsOfInt n);;
