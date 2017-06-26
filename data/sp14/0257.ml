
let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n = if n > 9 then digitalRoot (sumList n) else n;;


(* fix

let rec append l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (append t l2);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> append (listReverse t) [h];;

let rec digitsOfInt n =
  if n <= 0
  then []
  else listReverse ((n mod 10) :: (listReverse (digitsOfInt (n / 10))));;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  if n > 9 then digitalRoot (sumList (digitsOfInt n)) else n;;

*)

(* changed spans
(2,16)-(2,70)
(4,59)-(4,60)
*)

(* type error slice
(2,21)-(2,70)
(2,59)-(2,70)
(2,60)-(2,67)
(2,68)-(2,69)
(4,27)-(4,28)
(4,27)-(4,32)
(4,31)-(4,32)
(4,50)-(4,61)
(4,51)-(4,58)
(4,59)-(4,60)
*)

(* all spans
(2,16)-(2,70)
(2,21)-(2,70)
(2,27)-(2,29)
(2,43)-(2,44)
(2,55)-(2,70)
(2,55)-(2,56)
(2,59)-(2,70)
(2,60)-(2,67)
(2,68)-(2,69)
(4,20)-(4,68)
(4,24)-(4,68)
(4,27)-(4,32)
(4,27)-(4,28)
(4,31)-(4,32)
(4,38)-(4,61)
(4,38)-(4,49)
(4,50)-(4,61)
(4,51)-(4,58)
(4,59)-(4,60)
(4,67)-(4,68)
*)
