
let rec digitsOfInt n =
  if n <= 0
  then []
  else (let x = n mod 10
        and n = n / 10 in (digitsOfInt n) @ [x]);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  if n >= 10
  then let n = digitsOfInt n
       and f = sumList n in digitalRoot n
  else n;;
