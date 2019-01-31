
let rec wwhile (f,b) = match f b with | (h,t) -> if t = true then f h else h;;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' = false then b' else wwhile (f, b');;

*)

(* changed spans
(2,23)-(2,76)
match f b with
| (b' , c') -> if c' = false
               then b'
               else wwhile (f , b')
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,IteG EmptyG EmptyG EmptyG)])

(2,56)-(2,60)
c'
VarG

(2,66)-(2,67)
wwhile
VarG

(2,66)-(2,67)
(f , b')
TupleG (fromList [VarG])

(2,66)-(2,69)
b'
VarG

(2,66)-(2,69)
false
LitG

(2,75)-(2,76)
b'
VarG

*)
