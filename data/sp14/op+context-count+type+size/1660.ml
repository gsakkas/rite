
let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let x = [0];;

let rec additivePersistence n =
  if (sumList (digitsOfInt n)) < 9
  then (1 :: x; additivePersistence (sumList (digitsOfInt n)))
  else 1 :: x;
  sumList x;;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let x = [0];;

let rec additivePersistence n =
  if (sumList (digitsOfInt n)) < 9
  then (1 :: x; additivePersistence (sumList (digitsOfInt n)))
  else sumList x;;

*)

(* changed spans
(13,2)-(16,11)
(15,7)-(15,8)
(15,7)-(15,13)
(15,12)-(15,13)
*)

(* type error slice
(13,2)-(15,13)
(13,2)-(16,11)
(14,7)-(14,62)
(14,8)-(14,14)
(15,7)-(15,13)
*)
