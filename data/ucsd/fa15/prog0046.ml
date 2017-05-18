
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  let rec recCounter n count =
    if n < 10
    then count
    else recCounter ((sumList (digitsOfInt n)) (count + 1)) in
  recCounter n 0;;
