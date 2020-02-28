
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let foo f b =
    let result = f b in
    if result = b then (result, false) else (result, true) in
  wwhile (foo, b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let foo b =
    let result = f b in
    if result = b then (result, false) else (result, true) in
  wwhile (foo, b);;

*)

(* changed spans
(5,11)-(7,59)
fun b ->
  (let result = f b in
   if result = b
   then (result , false)
   else (result , true))
LamG VarPatG (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)

*)

(* type error slice
(2,24)-(2,78)
(2,38)-(2,39)
(2,38)-(2,41)
(2,56)-(2,62)
(2,56)-(2,70)
(2,63)-(2,70)
(2,64)-(2,65)
(5,3)-(8,18)
(5,11)-(7,59)
(5,13)-(7,59)
(8,3)-(8,9)
(8,3)-(8,18)
(8,10)-(8,18)
(8,11)-(8,14)
*)
