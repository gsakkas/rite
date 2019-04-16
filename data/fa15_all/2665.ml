
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let helper f b = (((f b) = b), (f b)) in wwhile ((helper f b), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let helper b = let fb = f b in if fb = b then (true, fb) else (false, fb) in
  wwhile (helper, b);;

*)

(* changed spans
(5,14)-(5,40)
fun b ->
  (let fb = f b in
   if fb = b
   then (true , fb)
   else (false , fb))
LamG VarPatG (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)

(5,52)-(5,64)
helper
VarG

*)

(* type error slice
(2,38)-(2,39)
(2,38)-(2,41)
(2,56)-(2,62)
(2,56)-(2,70)
(2,63)-(2,70)
(2,64)-(2,65)
(5,3)-(5,68)
(5,14)-(5,40)
(5,16)-(5,40)
(5,20)-(5,40)
(5,44)-(5,50)
(5,44)-(5,68)
(5,51)-(5,68)
(5,52)-(5,64)
(5,53)-(5,59)
*)
