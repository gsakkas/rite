
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
  then numdigits n
  else additivePersistence sumList n;;


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
(19,17)-(19,18)
(20,7)-(20,36)
(20,27)-(20,34)
(20,35)-(20,36)
*)

(* type error slice
(11,3)-(11,36)
(11,11)-(11,34)
(11,27)-(11,34)
(11,28)-(11,31)
(11,32)-(11,33)
(13,22)-(13,72)
(13,22)-(13,72)
(13,28)-(13,29)
(13,59)-(13,72)
(13,60)-(13,69)
(13,70)-(13,71)
(17,3)-(20,38)
(17,28)-(20,36)
(18,2)-(20,36)
(18,14)-(18,24)
(18,15)-(18,21)
(18,22)-(18,23)
(19,7)-(19,16)
(19,7)-(19,18)
(19,17)-(19,18)
(20,7)-(20,26)
(20,7)-(20,36)
*)
