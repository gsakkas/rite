
let rec digitsOfInt n =
  let ns = [] in
  match n with
  | 0 -> ns
  | n -> if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

let rec sumList xs =
  match xs with | [] -> 0 | xs -> (List.hd xs) + (sumList (List.tl xs));;

let rec digitalRoot n = sumList digitsOfInt n;;


(* fix

let rec digitsOfInt n =
  let ns = [] in
  match n with
  | 0 -> ns
  | n -> if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

let rec sumList xs =
  match xs with | [] -> 0 | xs -> (List.hd xs) + (sumList (List.tl xs));;

let rec digitalRoot n = sumList (digitsOfInt n);;

*)

(* changed spans
(11,24)-(11,45)
(11,32)-(11,43)
*)

(* type error slice
(9,34)-(9,71)
(9,49)-(9,71)
(9,50)-(9,57)
(11,24)-(11,31)
(11,24)-(11,45)
*)

(* all spans
(2,20)-(6,67)
(3,2)-(6,67)
(3,11)-(3,13)
(4,2)-(6,67)
(4,8)-(4,9)
(5,9)-(5,11)
(6,9)-(6,67)
(6,12)-(6,17)
(6,12)-(6,13)
(6,16)-(6,17)
(6,23)-(6,25)
(6,31)-(6,67)
(6,31)-(6,41)
(6,32)-(6,33)
(6,38)-(6,40)
(6,45)-(6,67)
(6,46)-(6,57)
(6,58)-(6,66)
(6,59)-(6,60)
(6,63)-(6,65)
(8,16)-(9,71)
(9,2)-(9,71)
(9,8)-(9,10)
(9,24)-(9,25)
(9,34)-(9,71)
(9,34)-(9,46)
(9,35)-(9,42)
(9,43)-(9,45)
(9,49)-(9,71)
(9,50)-(9,57)
(9,58)-(9,70)
(9,59)-(9,66)
(9,67)-(9,69)
(11,20)-(11,45)
(11,24)-(11,45)
(11,24)-(11,31)
(11,32)-(11,43)
(11,44)-(11,45)
*)
