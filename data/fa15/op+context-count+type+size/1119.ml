
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
(16,29)-(16,67)
(16,38)-(16,51)
(16,55)-(16,67)
(16,64)-(16,66)
*)

(* type error slice
(9,4)-(9,22)
(9,10)-(9,20)
(9,14)-(9,15)
(9,14)-(9,20)
(9,14)-(9,20)
(9,18)-(9,20)
(14,3)-(16,67)
(14,3)-(16,67)
(14,6)-(14,10)
(14,6)-(14,12)
(14,11)-(14,12)
(15,8)-(15,9)
(16,9)-(16,67)
(16,29)-(16,67)
(16,55)-(16,67)
*)
