
let rec digitsOfInt n =
  if n > 0 then (n mod 10) :: (digitsOfInt (n / 10)) else [];;

let rec listReverse l =
  match l with | [] -> [] | x::l' -> (listReverse l') @ [x];;

let digitsOfInt n =
  let explodeNum = if n > 0 then (n mod 10) :: (digitsOfInt (n / 10)) else [] in
  listReverse (explodeNum n);;
