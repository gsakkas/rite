
let rec wwhile (f,b) =
  match b with | (f',b') -> if b' then wwhile (f, f') else f';;


(* fix

let rec wwhile (f,b) =
  match f b with | (f',x') -> if x' then wwhile (f, f') else f';;

*)

(* changed spans
(3,2)-(3,61)
match f b with
| (f' , x') -> if x'
               then wwhile (f , f')
               else f'
CaseG (AppG [EmptyG]) [(Nothing,IteG EmptyG EmptyG EmptyG)]

(3,8)-(3,9)
f
VarG

(3,8)-(3,9)
f b
AppG [VarG]

(3,31)-(3,33)
x'
VarG

*)
