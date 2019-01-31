
let rec wwhile (f,b) = match f b with | (h,t) -> if t = true then t;;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' = false then b' else wwhile (f, b');;

*)

(* changed spans
(2,23)-(2,67)
match f b with
| (b' , c') -> if c' = false
               then b'
               else wwhile (f , b')
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,IteG EmptyG EmptyG EmptyG)])

(2,49)-(2,67)
c'
VarG

*)
