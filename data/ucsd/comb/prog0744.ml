
let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let rec loop n x = if n = 0 then x else loop (n / 10) ((n mod 10) :: x) in
     match n with | 0 -> [0] | _ -> loop n []);;

let digits n = digitsOfInt (abs n);;

let _ = digits - 1234;;
