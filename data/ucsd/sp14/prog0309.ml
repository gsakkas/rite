
let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let digitsOfInt n =
  let rec lastDigit n accu =
    if n <= 0 then accu else lastDigit (n / 10) ((n mod 10) :: accu) in
  match n with | _ -> lastDigit n [];;

let rec lengthOfList xs count =
  match xs with | [] -> 0 | hd::tl -> (lengthOfList tl count) + 1;;

let sumDigits x = sumList (digitsOfInt x);;

let additivePersistence n =
  let rec additiveSequence n count =
    match n with
    | 0 -> 0
    | _ ->
        if not ((lengthOfList (digitsOfInt n) 0) = 1)
        then (additiveSequence sumDigits n count) + 1
        else count in
  count = 0;;
