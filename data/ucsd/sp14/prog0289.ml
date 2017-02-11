
let rec digithelper n l =
  let x = n / 10 in
  let y = n mod 10 in if x = 0 then y :: l else digithelper x (y :: l);;

let digitsOfInt n = if n <= 0 then [] else digithelper n [];;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec addPHelper n =
  let lst = digitsOfInt n in
  let sum = sumList lst in if sum < 10 then sum else addPHelper sum;;

let digits n = digitsOfInt (abs n);;

let additivePersistence n = let pos = digits n in addPHelper n pos;;
