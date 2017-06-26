
let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let rec additivePersistence n =
  let count = 1 in if (sumList (digitsOfInt n)) > 9 then count = (count + 1);;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let rec additivePersistence n =
  let count = [0] in
  if (sumList (digitsOfInt n)) > 9
  then additivePersistence (sumList (digitsOfInt n))
  else sumList count;;

*)

(* changed spans
(11,14)-(11,15)
(11,19)-(11,76)
(11,57)-(11,62)
(11,57)-(11,76)
(11,65)-(11,76)
(11,66)-(11,71)
(11,74)-(11,75)
*)

(* type error slice
(11,19)-(11,76)
(11,57)-(11,76)
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
(10,28)-(11,76)
(11,2)-(11,76)
(11,14)-(11,15)
(11,19)-(11,76)
(11,22)-(11,51)
(11,22)-(11,47)
(11,23)-(11,30)
(11,31)-(11,46)
(11,32)-(11,43)
(11,44)-(11,45)
(11,50)-(11,51)
(11,57)-(11,76)
(11,57)-(11,62)
(11,65)-(11,76)
(11,66)-(11,71)
(11,74)-(11,75)
*)
