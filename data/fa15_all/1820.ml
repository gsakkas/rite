
let rec wwhile (f,b) = if f b then f (f, b) else 1;;


(* fix

let rec wwhile (f,b) = let (i,t) = f b in if t then wwhile (f, i) else i;;

*)

(* changed spans
(2,23)-(2,50)
let (i , t) = f b in
if t
then wwhile (f , i)
else i
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (IteG EmptyG EmptyG EmptyG)

(2,35)-(2,36)
wwhile
VarG

(2,35)-(2,43)
t
VarG

(2,35)-(2,43)
if t
then wwhile (f , i)
else i
IteG VarG (AppG (fromList [EmptyG])) VarG

(2,49)-(2,50)
i
VarG

*)
