
let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

let rec sum (n,i) =
  if n < 10
  then ((sumList (digitsOfInt n)), i)
  else ((sumList (digitsOfInt n)), (1 + 1));;

let rec additivePersistence_helper (n,i) =
  let temp = sum (n, i) in
  if (List.hd temp) >= 10
  then additivePersistence_helper (temp, (i + 1))
  else i;;
