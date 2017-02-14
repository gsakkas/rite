
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
(10,8)-(10,11)
(10,9)-(10,10)
(15,24)-(15,27)
*)

(* type error slice
(8,2)-(8,63)
(8,2)-(8,63)
(8,36)-(8,37)
(8,36)-(8,51)
(8,40)-(8,51)
(8,41)-(8,48)
(8,49)-(8,50)
(10,3)-(10,13)
(10,8)-(10,11)
(14,7)-(14,62)
(14,8)-(14,14)
(15,7)-(15,28)
(15,8)-(15,14)
(15,16)-(15,23)
(15,16)-(15,27)
(15,24)-(15,27)
(15,24)-(15,27)
(15,25)-(15,26)
*)
