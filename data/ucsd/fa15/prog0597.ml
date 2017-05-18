
let rec digitsOfInt n =
  (if n < 0
   then []
   else if n < 10 then [n] else (n mod 10) @ (digitsOfInt (n / 10)) : 
  int list);;
