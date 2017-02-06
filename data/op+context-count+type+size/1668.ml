
let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let x = [];;

let rec additivePersistence n =
  1 @ x;
  if (sumList (digitsOfInt n)) > 9
  then additivePersistence (sumList (digitsOfInt n))
  else sumList x;;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let x = [];;

let rec additivePersistence n =
  [1; 2];
  if (sumList (digitsOfInt n)) > 9
  then additivePersistence (sumList (digitsOfInt n))
  else sumList x;;

*)

(* changed spans
(13,3)-(13,8)
(13,5)-(13,6)
(13,7)-(13,8)
*)

(* type error slice
(2,21)-(5,62)
(3,3)-(5,62)
(3,6)-(3,7)
(3,6)-(3,12)
(4,8)-(4,10)
(5,8)-(5,16)
(5,8)-(5,62)
(5,33)-(5,41)
(5,33)-(5,62)
(5,33)-(5,62)
(5,43)-(5,54)
(5,43)-(5,62)
(7,17)-(8,63)
(8,3)-(8,63)
(8,3)-(8,63)
(8,3)-(8,63)
(8,3)-(8,63)
(8,9)-(8,11)
(8,37)-(8,38)
(8,42)-(8,49)
(8,42)-(8,51)
(8,42)-(8,51)
(8,50)-(8,51)
(10,4)-(10,13)
(10,9)-(10,11)
(12,29)-(16,17)
(13,3)-(13,4)
(13,3)-(13,8)
(13,3)-(13,8)
(13,3)-(13,8)
(13,3)-(16,17)
(13,5)-(13,6)
(13,7)-(13,8)
(14,3)-(16,17)
(14,28)-(14,29)
(15,8)-(15,27)
(15,8)-(15,51)
(16,16)-(16,17)
*)
