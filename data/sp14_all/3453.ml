
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
(13,3)-(16,12)
if sumList (digitsOfInt n) < 9
then (1 :: x;
additivePersistence (sumList (digitsOfInt n)))
else sumList x
IteG (BopG EmptyG EmptyG) (SeqG EmptyG EmptyG) (AppG [EmptyG])

*)

(* type error slice
(8,37)-(8,52)
(8,41)-(8,52)
(8,42)-(8,49)
(12,4)-(16,14)
(12,29)-(16,12)
(13,3)-(15,14)
(13,3)-(16,12)
(14,8)-(14,63)
(14,17)-(14,36)
(14,17)-(14,62)
(15,8)-(15,14)
(16,3)-(16,10)
(16,3)-(16,12)
*)
