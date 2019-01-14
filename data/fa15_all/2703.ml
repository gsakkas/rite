
let rec wwhile (f,b) =
  let x = f b in match x with | h::t -> if t = true then wwhile (f, h) else h;;


(* fix

let rec wwhile (f,b) =
  let x = f b in
  match x with | (x,y) -> if y = false then x else wwhile (f, x);;

*)

(* changed spans
(3,17)-(3,77)
match x with
| (x , y) -> if y = false
             then x
             else wwhile (f , x)
CaseG VarG (fromList [(Nothing,IteG EmptyG EmptyG EmptyG)])

(3,47)-(3,51)
y
VarG

(3,57)-(3,70)
x
VarG

(3,57)-(3,70)
false
LitG

(3,76)-(3,77)
x
VarG

*)
