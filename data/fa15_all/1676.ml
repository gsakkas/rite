
let rec digitsOfInt n =
  if n <= 0
  then []
  else (let x = n mod 10
        and n = n / 10 in (digitsOfInt n) @ [x]);;

let rec additivePersistence n = if n >= 10 then digitsOfInt n;;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else (let x = n mod 10
        and n = n / 10 in (digitsOfInt n) @ [x]);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let myHelper n = let n = digitsOfInt n in sumList n;;

let rec additivePersistence n =
  if n < 10 then 0 else (let x = myHelper n in 1 + (additivePersistence x));;

*)

(* changed spans
(8,36)-(8,43)
n < 10
BopG VarG LitG

(8,49)-(8,62)
0
LitG

(8,62)-(8,62)
let x = myHelper n in
1 + additivePersistence x
LetG NonRec [(VarPatG,AppG [EmptyG])] (BopG EmptyG EmptyG)

*)

(* type error slice
(6,27)-(6,42)
(6,27)-(6,48)
(6,28)-(6,39)
(6,43)-(6,44)
(8,33)-(8,62)
(8,49)-(8,60)
(8,49)-(8,62)
(8,62)-(8,62)
*)
