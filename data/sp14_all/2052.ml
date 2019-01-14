
let rec wwhile (f,b) = let (bs,cs) = f b in if cs then f bs else bs;;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

*)

(* changed spans
(2,23)-(2,67)
let (b' , c') = f b in
if c'
then wwhile (f , b')
else b'
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (IteG EmptyG EmptyG EmptyG)

(2,47)-(2,49)
c'
VarG

(2,55)-(2,56)
wwhile
VarG

(2,55)-(2,56)
(f , b')
TupleG (fromList [VarG])

(2,65)-(2,67)
b'
VarG

*)
