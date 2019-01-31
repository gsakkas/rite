
let rec wwhile (f,b) = match f b with | (h,t) -> if t = false then h else f h;;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' = false then b' else wwhile (f, b');;

*)

(* changed spans
(2,23)-(2,77)
match f b with
| (b' , c') -> if c' = false
               then b'
               else wwhile (f , b')
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,IteG EmptyG EmptyG EmptyG)])

(2,52)-(2,53)
c'
VarG

(2,67)-(2,68)
b'
VarG

(2,74)-(2,75)
wwhile
VarG

(2,74)-(2,75)
(f , b')
TupleG (fromList [VarG])

(2,76)-(2,77)
b'
VarG

*)
