
let rec wwhile (f,b) =
  let (value,result) = f b in if result then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile
    ((let helper func = let result = func b in (result, (result = b)) in
      helper f), b);;


(* fix

let rec wwhile (f,b) =
  let (value,result) = f b in if result then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile
    ((let helper b' = let result = f b' in (result, (result = b')) in helper),
      b);;

*)

(* changed spans
(7,18)-(7,70)
fun b' ->
  (let result = f b' in
   (result , result = b'))
LamG VarPatG (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)

(8,7)-(8,15)
helper
VarG

*)

(* type error slice
(3,24)-(3,25)
(3,24)-(3,27)
(3,46)-(3,52)
(3,46)-(3,63)
(3,53)-(3,63)
(3,54)-(3,55)
(6,3)-(6,9)
(6,3)-(8,20)
(7,5)-(8,20)
(7,6)-(8,16)
(7,18)-(7,70)
(7,25)-(7,70)
(7,48)-(7,70)
(8,7)-(8,13)
(8,7)-(8,15)
*)
