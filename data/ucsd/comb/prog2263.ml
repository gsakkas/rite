
let rec helperDigits (num,newList) =
  if num < 10
  then num :: newList
  else helperDigits ((num / 10), ((num mod 10) :: newList));;

let rec digitsOfInt n = if n < 0 then [] else helperDigits (n, []);;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec additivePersistence2 n =
  let newList = digitsOfInt n in
  let sum = sumList newList in
  if sum < 10
  then (Printf.printf "hi"; 0)
  else (Printf.printf "bye" 1) + (additivePersistence2 sum);;
