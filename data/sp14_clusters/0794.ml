
let rec wwhile (f,b) = if (f, b) > 100 then (f, b) else f (f, b);;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (x,trueOrFalse) -> if trueOrFalse then wwhile (f, x) else x;;

*)

(* changed spans
(2,44)-(2,50)
match f b with
| (x , trueOrFalse) -> if trueOrFalse
                       then wwhile (f , x)
                       else x
CaseG (AppG [EmptyG]) [(Nothing,IteG EmptyG EmptyG EmptyG)]

(2,45)-(2,46)
f b
AppG [VarG]

(2,56)-(2,57)
wwhile
VarG

(2,56)-(2,64)
trueOrFalse
VarG

(2,56)-(2,64)
if trueOrFalse
then wwhile (f , x)
else x
IteG VarG (AppG [EmptyG]) VarG

(2,62)-(2,63)
x
VarG

*)
