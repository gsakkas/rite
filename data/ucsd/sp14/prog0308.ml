
let rec myAppend list num =
  match list with | [] -> [num] | h::t -> h :: (myAppend t num);;

let rec digitsOfInt n =
  if n = 0
  then [0]
  else if n > 0 then myAppend digitsOfInt (n / 10) (n mod 10) else [];;
