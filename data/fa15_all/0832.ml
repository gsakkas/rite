
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
let n1 =
  (let x0 = digitsOfInt n in
   sumList x0) in
additivePersistence n1
LetG NonRec (fromList [LetG NonRec (fromList [EmptyG]) EmptyG]) (AppG (fromList [EmptyG]))

(16,37)-(16,50)
let x0 = digitsOfInt n in
sumList x0
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

(16,63)-(16,65)
x0
VarG

*)
