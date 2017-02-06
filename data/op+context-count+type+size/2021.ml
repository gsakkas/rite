
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

let rec listReverse l = match l with | [] -> 0 | x::l' -> [listReverse l'; x];;


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
(16,25)-(16,78)
(16,46)-(16,47)
(16,59)-(16,78)
(16,60)-(16,74)
(16,72)-(16,74)
(16,76)-(16,77)
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
(16,4)-(16,80)
(16,21)-(16,78)
(16,25)-(16,78)
(16,25)-(16,78)
(16,25)-(16,78)
(16,25)-(16,78)
(16,25)-(16,78)
(16,25)-(16,78)
(16,25)-(16,78)
(16,31)-(16,32)
(16,46)-(16,47)
(16,59)-(16,78)
(16,59)-(16,78)
(16,59)-(16,78)
(16,60)-(16,71)
(16,60)-(16,74)
(16,60)-(16,74)
(16,72)-(16,74)
(16,76)-(16,77)
*)
