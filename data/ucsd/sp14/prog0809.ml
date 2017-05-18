
let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let x = [];;

let rec additivePersistence n =
  let x = x + 1 in
  if (sumList (digitsOfInt n)) > 9
  then
    (print_string "going into then | ";
     additivePersistence (sumList (digitsOfInt n)))
  else (print_string "going into else | "; x);;
