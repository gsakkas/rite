
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
(18,12)-(18,70)
(18,21)-(18,34)
(18,38)-(18,70)
(18,46)-(18,48)
(18,49)-(18,68)
(18,69)-(18,70)
*)

(* type error slice
(11,55)-(11,70)
(11,59)-(11,70)
(11,60)-(11,67)
(18,38)-(18,45)
(18,38)-(18,70)
*)
