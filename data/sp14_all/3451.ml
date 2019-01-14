
let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let rec additivePersistence n =
  let x = [0] in
  if (sumList (digitsOfInt n)) > 9
  then 1 :: (x additivePersistence (sumList (digitsOfInt n)))
  else sumList x;;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let rec additivePersistence n =
  let x = [0] in
  if (sumList (digitsOfInt n)) > 9
  then (1 :: x; additivePersistence (sumList (digitsOfInt n)))
  else sumList x;;

*)

(* changed spans
(13,7)-(13,61)
1 :: x;
additivePersistence (sumList (digitsOfInt n))
SeqG (ConAppG (Just EmptyG) Nothing) (AppG (fromList [EmptyG]))

(13,15)-(13,34)
additivePersistence (sumList (digitsOfInt n))
AppG (fromList [AppG (fromList [EmptyG])])

*)
