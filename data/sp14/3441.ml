
let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let rec additivePersistence n =
  match digitsOfInt n with | [] -> 0 | _ -> sumList digitsOfInt n;;


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
(11,44)-(11,65)
(11,52)-(11,63)
*)

(* type error slice
(8,36)-(8,51)
(8,40)-(8,51)
(8,41)-(8,48)
(11,44)-(11,51)
(11,44)-(11,65)
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
(10,28)-(11,65)
(11,2)-(11,65)
(11,8)-(11,21)
(11,8)-(11,19)
(11,20)-(11,21)
(11,35)-(11,36)
(11,44)-(11,65)
(11,44)-(11,51)
(11,52)-(11,63)
(11,64)-(11,65)
*)
