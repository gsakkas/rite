
let rec digithelper n l =
  let x = n / 10 in
  let y = n mod 10 in if x <= 0 then y :: l else digithelper x (y :: l);;

let digitsOfInt n = if n < 0 then [] else digithelper n [];;

let _ = digitsOfInt - 1;;
