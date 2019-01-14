
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
let n1 =
  (let x0 = digitsOfInt n in
   sumList x0) in
additivePersistence n1
LetG NonRec (fromList [LetG NonRec (fromList [EmptyG]) EmptyG]) (AppG (fromList [EmptyG]))

(19,18)-(19,31)
let x0 = digitsOfInt n in
sumList x0
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

(20,42)-(20,44)
x0
VarG

(20,68)-(20,70)
n1
VarG

*)
