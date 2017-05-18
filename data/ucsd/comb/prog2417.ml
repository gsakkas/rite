
let rec digitsOfInt n =
  if n > 0 then (n mod 10) :: (digitsOfInt (n / 10)) else [];;

let rec listReverse l =
  match l with | [] -> [] | x::l' -> (listReverse l') @ [x];;

let digitsOfInt n =
  let explodeNum n =
    if n > 0 then (n mod 10) :: (digitsOfInt (n / 10)) else [] in
  listReverse (explodeNum n);;

let listReverse l =
  let rec r e a = match a with | [] -> [] | x::l' -> x :: e :: (r e l') in
  r [] l;;

let digitsOfInt n =
  let explodeNum n =
    if n > 0 then (n mod 10) :: (digitsOfInt (n / 10)) else [] in
  listReverse (explodeNum n);;
