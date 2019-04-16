
let rec digitsOfInt n =
  if n <= 0
  then []
  else (let x = n mod 10
        and n = n / 10 in (digitsOfInt n) @ [x]);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n = if n >= 10 then sumList digitsOfInt n;;


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
(10,36)-(10,43)
n < 10
BopG VarG LitG

(10,49)-(10,70)
0
LitG

(10,70)-(10,70)
let x = myHelper n in
1 + additivePersistence x
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (BopG EmptyG EmptyG)

*)

(* type error slice
(8,56)-(8,71)
(8,60)-(8,71)
(8,61)-(8,68)
(10,49)-(10,56)
(10,49)-(10,70)
*)
