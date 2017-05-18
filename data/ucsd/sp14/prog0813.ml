
let rec listReverse l = List.rev l;;

let rec digitsOfInt n =
  if n <= 0
  then []
  else listReverse ((n mod 10) :: (listReverse (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let rec apCalc n a =
  if (sumList (digitsOfInt n)) > 9
  then apCalc (sumList (digitsOfInt n)) (a + 1)
  else a;;

let additivePersistence n = apCalc n 1;;

let _ = additivePersistence 9876 1;;
