
let x = 123;;

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let x = n / 10
     and y = n mod 10 in
     if (x = 0) && (y = 0) then [] else (digitsOfInt x) @ [y]);;

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

let x = sumList (digitsOfInt 30);;

let rec listReverse l =
  match l with | [] -> 0 | x::l' -> (listReverse l') :: x;;


(* fix

let x = 123;;

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let x = n / 10
     and y = n mod 10 in
     if (x = 0) && (y = 0) then [] else (digitsOfInt x) @ [y]);;

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

let x = sumList (digitsOfInt 30);;

let rec listReverse l =
  match l with
  | [] -> []
  | x::[] -> [x]
  | head::tail -> (listReverse tail) @ [head];;

*)

(* changed spans
(17,3)-(17,58)
(17,24)-(17,25)
(17,38)-(17,52)
(17,38)-(17,58)
(17,50)-(17,52)
(17,57)-(17,58)
*)

(* type error slice
(4,21)-(10,62)
(5,3)-(10,62)
(5,6)-(5,7)
(5,6)-(5,11)
(6,8)-(6,10)
(10,6)-(10,62)
(10,33)-(10,35)
(10,42)-(10,53)
(10,42)-(10,55)
(10,42)-(10,62)
(10,42)-(10,62)
(10,57)-(10,58)
(12,17)-(12,74)
(12,22)-(12,74)
(12,22)-(12,74)
(12,22)-(12,74)
(12,22)-(12,74)
(12,28)-(12,30)
(12,58)-(12,59)
(12,63)-(12,70)
(12,63)-(12,74)
(12,63)-(12,74)
(12,71)-(12,74)
(16,4)-(17,60)
(16,21)-(17,58)
(17,3)-(17,58)
(17,3)-(17,58)
(17,3)-(17,58)
(17,3)-(17,58)
(17,3)-(17,58)
(17,3)-(17,58)
(17,3)-(17,58)
(17,9)-(17,10)
(17,24)-(17,25)
(17,38)-(17,49)
(17,38)-(17,52)
(17,38)-(17,52)
(17,38)-(17,58)
(17,50)-(17,52)
(17,57)-(17,58)
*)
