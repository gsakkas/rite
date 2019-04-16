
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
(19,18)-(19,19)
digits n
AppG (fromList [VarG])

(20,8)-(20,37)
additivePersistence (sumList (digits n))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(11,4)-(11,37)
(11,12)-(11,35)
(11,28)-(11,35)
(11,29)-(11,32)
(11,33)-(11,34)
(13,23)-(13,73)
(13,29)-(13,30)
(13,60)-(13,73)
(13,61)-(13,70)
(13,71)-(13,72)
(17,4)-(20,39)
(17,29)-(20,37)
(18,3)-(20,37)
(18,15)-(18,25)
(18,16)-(18,22)
(18,23)-(18,24)
(19,8)-(19,17)
(19,8)-(19,19)
(19,18)-(19,19)
(20,8)-(20,27)
(20,8)-(20,37)
*)
