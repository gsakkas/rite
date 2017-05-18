
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs =
  match xs with | [] -> 0 | head::tail -> head + (sumList tail);;

let rec additivePersistence n =
  let x = digitsOfInt in
  match x with
  | [] -> 0
  | head::[] -> 0
  | head::tail -> 1 + (additivePersistence (sumList x));;
