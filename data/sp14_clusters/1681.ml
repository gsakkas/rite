
let (x,y) = ("5", 5);;

let rec wwhile (f,b) =
  let f b = (x, y) in if x = true then wwhile (f, x) else x;;


(* fix

let rec wwhile (f,b) =
  let (a',b') = f b in if b' = true then wwhile (f, b') else a';;

*)

(* changed spans
(5,16)-(5,17)
let (a' , b') = f b in
if b' = true
then wwhile (f , b')
else a'
LetG NonRec [AppG [EmptyG]] (IteG EmptyG EmptyG EmptyG)

(5,22)-(5,59)
f
VarG

(5,22)-(5,59)
b
VarG

(5,22)-(5,59)
f b
AppG [VarG]

(5,25)-(5,26)
b'
VarG

(5,58)-(5,59)
b'
VarG

*)
