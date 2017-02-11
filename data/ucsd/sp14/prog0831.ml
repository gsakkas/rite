
let digitsOfInt n =
  let rec lastDigit n accu =
    if n <= 0 then accu else lastDigit (n / 10) ((n mod 10) :: accu) in
  match n with | _ -> lastDigit n [];;

let rec additivePersistence n =
  match n with | 0 -> 0 | _ -> additivePersistence sumList (digitsOfInt n);;
