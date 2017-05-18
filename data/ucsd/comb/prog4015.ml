
let rec reverseInt x y =
  if x != 0 then reverseInt (x / 10) ((y * 10) + (10 mod 10)) else y;;

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let x = (reverseInt n) / 10
     and y = (reverseInt n) mod 10 in
     if (x = 0) && (y = 0) then [] else y :: (digitsOfInt x));;
