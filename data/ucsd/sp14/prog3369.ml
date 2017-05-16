
let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let rec additivePersistence n =
  let x = 1 in
  if (sumList (digitsOfInt n)) > 9
  then x + (1 additivePersistence (sumList (digitsOfInt n)))
  else sumList count;;
