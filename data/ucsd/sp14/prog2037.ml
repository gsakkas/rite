
let rec addList (f,xs) =
  match xs with | [] -> 0 | h::t -> h + (addList (f, t));;

let rec digitsOfInt n =
  if n < 1 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let _ = addList (digitsOfInt, 5);;
