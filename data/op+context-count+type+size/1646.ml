
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
(15,8)-(15,9)
(15,8)-(15,14)
(15,13)-(15,14)
*)

(* type error slice
(5,43)-(5,54)
(5,43)-(5,62)
(5,56)-(5,62)
(8,3)-(8,63)
(8,42)-(8,49)
(8,42)-(8,51)
(8,50)-(8,51)
(10,4)-(10,14)
(10,9)-(10,12)
(10,10)-(10,11)
(12,4)-(16,14)
(12,29)-(16,12)
(13,3)-(16,12)
(13,16)-(13,27)
(13,16)-(13,29)
(13,28)-(13,29)
(14,17)-(14,36)
(14,17)-(14,60)
(14,38)-(14,45)
(14,38)-(14,60)
(14,47)-(14,58)
(14,47)-(14,60)
(14,59)-(14,60)
(16,3)-(16,10)
(16,3)-(16,12)
(16,11)-(16,12)
*)
