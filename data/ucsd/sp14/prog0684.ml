
let rec digithelper n l =
  let x = n / 10 in
  let y = n mod 10 in if x = 0 then y :: l else digithelper x (y :: l);;

let digitsOfInt n = if n <= 0 then [] else digithelper n [];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec addPHelper n c =
  let n_pos = digits n in
  let sum = sumList n_pos in if sum < 10 then c else addPHelper sum (c + 1);;

let additivePersistence n = addPHelper n 1;;

let _ = additivePersistence - 12;;
