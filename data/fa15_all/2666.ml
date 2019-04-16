
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let helper b = (((f b) = b), (f b)) in wwhile ((helper b), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let helper b = let fb = f b in if fb = b then (true, fb) else (false, fb) in
  wwhile (helper, b);;

*)

(* changed spans
(5,18)-(5,38)
let fb = f b in
if fb = b
then (true , fb)
else (false , fb)
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (IteG EmptyG EmptyG EmptyG)

(5,50)-(5,60)
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
(5,3)-(5,64)
(5,14)-(5,38)
(5,18)-(5,38)
(5,42)-(5,48)
(5,42)-(5,64)
(5,49)-(5,64)
(5,50)-(5,60)
(5,51)-(5,57)
*)
