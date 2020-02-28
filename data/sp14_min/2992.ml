
let rec digitsOfInt n =
  if n <= 0
  then []
  else
    (let rec loop n a = if n = 0 then a else loop (n / 10) ((n mod 10) :: a) in
     match n with | 0 -> [0] | _ -> loop n []);;

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

let rec additivePersistence n =
  if n < 10 then n else n = (sumList (digitsOfInt n));;


(* fix

let a = int_of_char '3';;

let rec digitsOfInt n =
  if n <= 0
  then []
  else
    (let rec loop n a = if n = 0 then a else loop (n / 10) ((n mod 10) :: a) in
     match n with | 0 -> [0] | _ -> loop n []);;

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

let rec additivePersistence n =
  if n < 10 then a else additivePersistence (sumList (digitsOfInt n));;

*)

(* changed spans
(12,18)-(12,19)
a
VarG

(12,25)-(12,54)
additivePersistence (sumList (digitsOfInt n))
AppG [AppG [EmptyG]]

*)

(* type error slice
(12,3)-(12,54)
(12,6)-(12,7)
(12,6)-(12,12)
(12,10)-(12,12)
(12,18)-(12,19)
(12,25)-(12,54)
*)
