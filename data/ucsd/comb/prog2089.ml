
let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let rec digits n digitList =
       if n = 0 then digitList else digits (n / 10) ((n mod 10) :: digitList) in
     match n with | 0 -> [0] | _ -> digits n []);;

let _ = digitsOfInt - 1;;
