
let modulus ss = ss mod 10;;

let rec digitsOfInt n =
  if n <= 0
  then []
  else (match n with | x -> (digitsOfInt (n / 10)) @ [modulus x]);;

let lt10 q = q < 10;;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if lt10 n
  then n
  else (match n with | n -> let x_ = digitsOfInt n in [sumList x_]);;


(* fix

let modulus ss = ss mod 10;;

let rec digitsOfInt n =
  if n <= 0
  then []
  else (match n with | x -> (digitsOfInt (n / 10)) @ [modulus x]);;

let lt10 q = q < 10;;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if lt10 n
  then n
  else
    (match n with
     | n ->
         let n1 = let x0 = digitsOfInt n in sumList x0 in
         additivePersistence n1);;

*)

(* changed spans
(16,28)-(16,66)
(16,37)-(16,50)
(16,54)-(16,66)
(16,63)-(16,65)
*)

(* type error slice
(9,3)-(9,21)
(9,9)-(9,19)
(9,13)-(9,14)
(9,13)-(9,19)
(9,13)-(9,19)
(9,17)-(9,19)
(14,2)-(16,67)
(14,2)-(16,67)
(14,5)-(14,9)
(14,5)-(14,11)
(14,10)-(14,11)
(15,7)-(15,8)
(16,7)-(16,67)
(16,28)-(16,66)
(16,54)-(16,66)
*)
