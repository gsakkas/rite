
let rec append xs x =
  match xs with | [] -> [x] | hd::tl -> hd :: (append tl x);;

let rec digitsOfInt n =
  if n <= 0 then [] else append digitsOfInt (n / 10) (n - ((n / 10) * 10));;
