
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
     | n -> let x_ = digitsOfInt n in sumList x_ additivePersistence n);;


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
(18,13)-(18,71)
(18,22)-(18,35)
(18,39)-(18,71)
(18,47)-(18,49)
(18,50)-(18,69)
(18,70)-(18,71)
*)

(* type error slice
(11,56)-(11,70)
(11,61)-(11,68)
(11,61)-(11,70)
(18,39)-(18,46)
(18,39)-(18,71)
*)
