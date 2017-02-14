
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
(11,9)-(11,19)
(11,9)-(11,59)
(11,21)-(11,46)
(11,47)-(11,58)
*)

(* type error slice
(5,55)-(5,70)
(5,59)-(5,70)
(5,60)-(5,67)
(8,2)-(12,16)
(8,21)-(11,59)
(8,23)-(11,59)
(9,4)-(11,59)
(9,4)-(11,59)
(10,9)-(10,14)
(11,9)-(11,19)
(11,9)-(11,59)
(11,20)-(11,59)
(11,21)-(11,46)
(11,22)-(11,29)
(11,47)-(11,58)
(11,48)-(11,53)
(12,2)-(12,12)
(12,2)-(12,16)
*)
