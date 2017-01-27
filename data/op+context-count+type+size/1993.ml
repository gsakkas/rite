
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

let rec listReverse l = match l with | [] -> 0 | x::xl -> [listReverse x];;


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
(16,25)-(16,74)
(16,46)-(16,47)
(16,60)-(16,71)
(16,60)-(16,73)
*)

(* type error slice
(16,4)-(16,76)
(16,21)-(16,74)
(16,25)-(16,74)
(16,31)-(16,32)
(16,46)-(16,47)
(16,59)-(16,74)
(16,60)-(16,71)
(16,60)-(16,73)
(16,72)-(16,73)
*)
