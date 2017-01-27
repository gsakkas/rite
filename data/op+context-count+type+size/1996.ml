
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
  match l with | [] -> 0 | x::l' -> (listReverse l') @ [x];;


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
(17,3)-(17,59)
(17,24)-(17,25)
(17,38)-(17,59)
(17,50)-(17,52)
(17,57)-(17,58)
*)

(* type error slice
(16,4)-(17,61)
(16,21)-(17,59)
(17,3)-(17,59)
(17,9)-(17,10)
(17,24)-(17,25)
(17,38)-(17,49)
(17,38)-(17,52)
(17,38)-(17,59)
(17,50)-(17,52)
(17,54)-(17,55)
(17,56)-(17,59)
(17,57)-(17,58)
*)
