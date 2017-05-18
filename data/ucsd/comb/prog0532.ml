
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | t::h -> t + (sumList h);;

let rec additivePersAndRoot num persCount =
  if num < 10
  then (persCount, num)
  else
    (let xs = digits num in
     let theSum = sumList xs in additivePersAndRoot theSum (persCount + 1));;

let _ = additivePersAndRoot [9; 8; 7; 6] 0;;
