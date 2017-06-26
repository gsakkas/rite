
let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec additivePersistence n =
  match digitsOfInt n with | [] -> 0 | h::t -> h + t;;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let rec additivePersistence n =
  match digitsOfInt n with | [] -> 0 | _ -> sumList (digitsOfInt n);;

*)

(* changed spans
(7,28)-(8,52)
(8,2)-(8,52)
(8,47)-(8,48)
(8,47)-(8,52)
(8,51)-(8,52)
*)

(* type error slice
(8,2)-(8,52)
(8,47)-(8,52)
(8,51)-(8,52)
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
(7,28)-(8,52)
(8,2)-(8,52)
(8,8)-(8,21)
(8,8)-(8,19)
(8,20)-(8,21)
(8,35)-(8,36)
(8,47)-(8,52)
(8,47)-(8,48)
(8,51)-(8,52)
*)
