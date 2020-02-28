
let rec countlist x = match x with | [] -> 0 | h::t -> 1 + (countlist t);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  let x = sumList n in if x < 10 then countlist n else additivePersistence x;;


(* fix

let rec append x y = match y with | [] -> [x] | h::t -> h :: (append x t);;

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let (x,y) = ((n mod 10), (n / 10)) in
     if n < 10 then [n] else append x (digitsOfInt y));;

let digits n = digitsOfInt (abs n);;

let rec numdigits x = match x with | [] -> 0 | h::t -> 1 + (numdigits x);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (sumList (digits n)) < 10
  then numdigits (digits n)
  else additivePersistence (sumList (digits n));;

*)

(* changed spans
(7,3)-(7,77)
if sumList (digits n) < 10
then numdigits (digits n)
else additivePersistence (sumList (digits n))
IteG (BopG EmptyG EmptyG) (AppG [EmptyG]) (AppG [EmptyG])

*)

(* type error slice
(4,22)-(4,71)
(4,56)-(4,71)
(4,60)-(4,71)
(4,61)-(4,68)
(4,69)-(4,70)
(6,4)-(7,79)
(6,29)-(7,77)
(7,3)-(7,77)
(7,11)-(7,18)
(7,11)-(7,20)
(7,19)-(7,20)
(7,56)-(7,75)
(7,56)-(7,77)
(7,76)-(7,77)
*)
