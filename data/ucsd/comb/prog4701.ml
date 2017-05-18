
let digitsOfInt n =
  let rec lastDigit n acc =
    if n <= 0 then acc else lastDigit (n / 10) ((n mod 10) :: acc) in
  match n with | _ -> lastDigit n [];;

let rec lengthOfList xs count =
  match xs with | [] -> 0 | hd::tl -> (lengthOfList tl count) + 1;;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let x = [1; 2; 3];;

let additivePersistence n =
  let rec sequence n i =
    if (lengthOfList (digitsOfInt n) 0) = 1
    then i
    else (sequence sumList (digitsOfInt x) i) + 1 in
  match n with | _ -> sequence n 0;;
