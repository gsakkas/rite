
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
         let x_ = digitsOfInt n in
         (sumList x_) = (let xx = sumList x_ in additivePersistence xx));;


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
(19,9)-(20,71)
(19,18)-(19,31)
(20,9)-(20,71)
(20,18)-(20,20)
(20,24)-(20,71)
(20,34)-(20,41)
(20,34)-(20,44)
(20,42)-(20,44)
*)

(* type error slice
(9,3)-(9,21)
(9,9)-(9,19)
(9,13)-(9,14)
(9,13)-(9,19)
(9,13)-(9,19)
(9,17)-(9,19)
(14,2)-(20,72)
(14,2)-(20,72)
(14,5)-(14,9)
(14,5)-(14,11)
(14,10)-(14,11)
(15,7)-(15,8)
(17,4)-(20,72)
(19,9)-(20,71)
(20,9)-(20,71)
*)
