
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
(7,29)-(8,53)
(8,3)-(8,53)
(8,9)-(8,20)
(8,9)-(8,22)
(8,21)-(8,22)
(8,36)-(8,37)
(8,52)-(8,53)
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
(7,4)-(8,55)
(7,29)-(8,53)
(8,3)-(8,53)
(8,3)-(8,53)
(8,3)-(8,53)
(8,21)-(8,22)
(8,48)-(8,49)
(8,48)-(8,53)
(8,48)-(8,53)
(8,52)-(8,53)
*)
