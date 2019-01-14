
let rec wwhile (f,b) =
  let x = wwhile (f, b) in
  let h::t = x in
  let r::l = t in match r with | false  -> h | true  -> wwhile (f, h);;


(* fix

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

*)

(* changed spans
(3,2)-(5,69)
let (x , y) = f b in
match y with
| false -> x
| true -> wwhile (f , x)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(5,43)-(5,44)
y
VarG

(5,56)-(5,69)
x
VarG

(5,67)-(5,68)
x
VarG

*)
