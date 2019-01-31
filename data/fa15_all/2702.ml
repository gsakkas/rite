
let rec wwhile (f,b) =
  let x = f b in match x with | h::t -> if t then wwhile (f, h) else h;;


(* fix

let rec wwhile (f,b) =
  let x = f b in
  match x with | (x,y) -> if y = false then x else wwhile (f, x);;

*)

(* changed spans
(3,17)-(3,70)
match x with
| (x , y) -> if y = false
             then x
             else wwhile (f , x)
CaseG VarG (fromList [(Nothing,IteG EmptyG EmptyG EmptyG)])

(3,43)-(3,44)
y = false
BopG VarG LitG

(3,50)-(3,63)
y
VarG

(3,50)-(3,63)
x
VarG

(3,50)-(3,63)
false
LitG

(3,69)-(3,70)
x
VarG

*)
