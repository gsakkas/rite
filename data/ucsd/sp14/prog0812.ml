
let rec listReverse l = List.rev l;;

let additivePersistence n a = n + a;;

let rec digitsOfInt n =
  if n <= 0
  then []
  else listReverse ((n mod 10) :: (listReverse (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let additivePersistence n a =
  if (sumList (digitsOfInt n)) > 9
  then additivePersistence (sumList (digitsOfInt n)) (a + 1);;
