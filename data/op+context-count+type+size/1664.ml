
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
(11,15)-(11,16)
(11,20)-(11,76)
(11,58)-(11,63)
(11,58)-(11,76)
(11,67)-(11,72)
(11,67)-(11,76)
(11,75)-(11,76)
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
(10,4)-(11,79)
(10,29)-(11,76)
(11,20)-(11,76)
(11,20)-(11,76)
(11,20)-(11,76)
(11,45)-(11,46)
(11,58)-(11,76)
*)
