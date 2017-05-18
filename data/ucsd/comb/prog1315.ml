
let rec append xs1 xs2 =
  match xs1 with | [] -> xs2 | hd::tl -> hd :: (append tl xs2);;

let rec digitsOfInt n =
  if n <= 0 then [] else append (digitsOfInt (n / 10)) [n - ((n / 10) * 10)];;

let digits n = digitsOfInt (abs n);;

let _ = digits - 1000;;
