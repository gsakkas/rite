
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
(20,8)-(20,37)
additivePersistence (sumList (digits n))
AppG [AppG [EmptyG]]

*)

(* type error slice
(17,4)-(20,39)
(17,29)-(20,37)
(18,3)-(20,37)
(20,8)-(20,27)
(20,8)-(20,37)
*)
