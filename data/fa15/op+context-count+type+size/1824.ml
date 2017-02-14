
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  let rec recCounter n count =
    if n < 10
    then count
    else recCounter ((sumList (digitsOfInt n)) (count + 1)) in
  recCounter n 0;;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  let rec recCounter n count =
    if n < 10
    then count
    else (recCounter (sumList (digitsOfInt n)) count) + 1 in
  recCounter n 0;;

*)

(* changed spans
(11,10)-(11,20)
(11,10)-(11,58)
(11,23)-(11,45)
(11,49)-(11,58)
*)

(* type error slice
(5,56)-(5,70)
(5,61)-(5,68)
(5,61)-(5,70)
(8,3)-(12,17)
(8,22)-(11,58)
(8,24)-(11,58)
(9,5)-(11,58)
(9,5)-(11,58)
(10,10)-(10,15)
(11,10)-(11,20)
(11,10)-(11,58)
(11,23)-(11,30)
(11,23)-(11,45)
(11,23)-(11,58)
(11,49)-(11,54)
(11,49)-(11,58)
(12,3)-(12,13)
(12,3)-(12,17)
*)
