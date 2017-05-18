
let rec append xs x =
  match xs with | [] -> [x] | hd::tl -> hd :: (append tl x);;

let rec digitsOfInt n =
  if n <= 0 then [] else n - ((n / 10) * (10 append digitsOfInt (n / 10)));;
