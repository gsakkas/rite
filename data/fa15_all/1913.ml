
let rec wwhile (f,b) =
  match f b with | (b',true ) -> f b' | (b',false ) -> b';;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

*)

(* changed spans
(3,2)-(3,57)
match f b with
| (b' , c') -> if c'
               then wwhile (f , b')
               else b'
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,IteG EmptyG EmptyG EmptyG)])

(3,33)-(3,34)
wwhile
VarG

(3,33)-(3,34)
(f , b')
TupleG (fromList [VarG])

(3,33)-(3,37)
c'
VarG

(3,33)-(3,37)
if c'
then wwhile (f , b')
else b'
IteG VarG (AppG (fromList [EmptyG])) VarG

*)
