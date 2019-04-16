
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
(11,10)-(11,60)
recCounter (sumList (digitsOfInt n))
           count + 1
BopG (AppG (fromList [EmptyG])) LitG

*)

(* type error slice
(5,56)-(5,71)
(5,60)-(5,71)
(5,61)-(5,68)
(8,3)-(12,17)
(8,22)-(11,60)
(8,24)-(11,60)
(9,5)-(11,60)
(10,10)-(10,15)
(11,10)-(11,20)
(11,10)-(11,60)
(11,21)-(11,60)
(11,22)-(11,47)
(11,23)-(11,30)
(11,48)-(11,59)
(11,49)-(11,54)
(12,3)-(12,13)
(12,3)-(12,17)
*)
