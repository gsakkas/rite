
let rec digitsOfInt n =
  if n < 0
  then Printf.fprintf "%d\n" 0
  else Print.fprintf "%d " digitsOfInt (n / 10);;
