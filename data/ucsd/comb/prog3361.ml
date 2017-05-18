
let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec additivePersistence n =
  match digitsOfInt n with | [] -> 0 | h::t -> h + t;;
