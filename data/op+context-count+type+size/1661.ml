
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
  else (1 :: x; sumList [x]);;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let x = [];;

let rec additivePersistence n =
  if (sumList (digitsOfInt n)) < 9
  then (1 :: x; additivePersistence (sumList (digitsOfInt n)))
  else (1 :: x; sumList x);;

*)

(* changed spans
(10,9)-(10,12)
(10,10)-(10,11)
(15,25)-(15,28)
*)

(* type error slice
(8,3)-(8,63)
(8,3)-(8,63)
(8,37)-(8,38)
(8,37)-(8,51)
(8,42)-(8,49)
(8,42)-(8,51)
(8,50)-(8,51)
(10,4)-(10,14)
(10,9)-(10,12)
(14,9)-(14,15)
(14,9)-(14,60)
(15,9)-(15,15)
(15,9)-(15,28)
(15,17)-(15,24)
(15,17)-(15,28)
(15,25)-(15,28)
(15,25)-(15,28)
(15,26)-(15,27)
*)
