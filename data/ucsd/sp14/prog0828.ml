
let digitsOfInt n =
  if n <= 0
  then []
  else
    (let rec addDigit n acc =
       if n <= 0 then acc else addDigit (n / 10) ((n mod 10) :: acc) in
     match n with | 0 -> [0] | _ -> addDigit n []);;

let _ = digitsOfInt - 3124;;
