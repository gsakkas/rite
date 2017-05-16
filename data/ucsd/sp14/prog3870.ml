
let rec mylength xs = match xs with | [] -> 0 | hd::tl -> 1 + (mylength tl);;

let digitsOfInt n =
  let rec digits n x list =
    if n < 10
    then n :: list
    else
      digits ((n / 10) + (n mod 10)) (((mylength n) / 10) + (n mod 10)) list in
  digits n (mylength n) [];;
