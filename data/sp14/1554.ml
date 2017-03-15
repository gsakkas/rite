
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
(13,2)-(13,7)
(13,4)-(13,5)
(13,6)-(13,7)
*)

(* type error slice
(13,2)-(13,3)
(13,2)-(13,7)
(13,4)-(13,5)
*)

(* all spans
(2,20)-(5,65)
(3,2)-(5,65)
(3,5)-(3,11)
(3,5)-(3,6)
(3,10)-(3,11)
(4,7)-(4,9)
(5,7)-(5,65)
(5,7)-(5,15)
(5,16)-(5,65)
(5,17)-(5,27)
(5,18)-(5,19)
(5,24)-(5,26)
(5,31)-(5,64)
(5,32)-(5,40)
(5,41)-(5,63)
(5,42)-(5,53)
(5,54)-(5,62)
(5,55)-(5,56)
(5,59)-(5,61)
(7,16)-(8,63)
(8,2)-(8,63)
(8,8)-(8,10)
(8,24)-(8,25)
(8,36)-(8,51)
(8,36)-(8,37)
(8,40)-(8,51)
(8,41)-(8,48)
(8,49)-(8,50)
(8,59)-(8,63)
(10,8)-(10,10)
(12,28)-(16,16)
(13,2)-(16,16)
(13,2)-(13,7)
(13,4)-(13,5)
(13,2)-(13,3)
(13,6)-(13,7)
(14,2)-(16,16)
(14,5)-(14,34)
(14,5)-(14,30)
(14,6)-(14,13)
(14,14)-(14,29)
(14,15)-(14,26)
(14,27)-(14,28)
(14,33)-(14,34)
(15,7)-(15,52)
(15,7)-(15,26)
(15,27)-(15,52)
(15,28)-(15,35)
(15,36)-(15,51)
(15,37)-(15,48)
(15,49)-(15,50)
(16,7)-(16,16)
(16,7)-(16,14)
(16,15)-(16,16)
*)
