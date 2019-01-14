
let rec wwhile (f,b) =
  let x = f b in
  match x with | h::t -> if t = false then h else wwhile (f, h);;


(* fix

let rec wwhile (f,b) =
  let x = f b in
  match x with | (x,y) -> if y = false then x else wwhile (f, x);;

*)

(* changed spans
(4,2)-(4,63)
match x with
| (x , y) -> if y = false
             then x
             else wwhile (f , x)
CaseG VarG (fromList [(Nothing,IteG EmptyG EmptyG EmptyG)])

(4,28)-(4,29)
y
VarG

(4,43)-(4,44)
x
VarG

(4,61)-(4,62)
x
VarG

*)
