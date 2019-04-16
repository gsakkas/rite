
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
(19,10)-(20,72)
let n1 =
  (let x0 = digitsOfInt n in
   sumList x0) in
additivePersistence n1
LetG NonRec (fromList [(VarPatG,LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)]) (AppG (fromList [EmptyG]))

*)

(* type error slice
(9,4)-(9,22)
(9,10)-(9,20)
(9,14)-(9,15)
(9,14)-(9,20)
(9,18)-(9,20)
(11,56)-(11,71)
(11,60)-(11,71)
(11,61)-(11,68)
(13,4)-(20,75)
(13,29)-(20,73)
(14,3)-(20,73)
(14,6)-(14,10)
(14,6)-(14,12)
(14,11)-(14,12)
(15,8)-(15,9)
(17,5)-(20,73)
(19,10)-(20,72)
(20,10)-(20,72)
(20,25)-(20,72)
(20,35)-(20,42)
(20,35)-(20,45)
(20,49)-(20,68)
(20,49)-(20,71)
(20,69)-(20,71)
*)
