
let rec digitsHelper n l =
  if (n mod 10) = n then [] else digitsHelper (n / 10) ((n mod 10) :: l);;

let digitsOfInt n =
  let l = [] in if n < 0 then l else (digitsHelper n l 30) mod 10;;
