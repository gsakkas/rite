
let rec wwhile (f,b) =
  let x = wwhile (f, b) in
  let h::t = x in match t with | false  -> h | true  -> wwhile (f, h);;


(* fix

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

*)

(* changed spans
(3,2)-(4,69)
let (x , y) = f b in
match y with
| false -> x
| true -> wwhile (f , x)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(4,43)-(4,44)
y
VarG

(4,56)-(4,69)
x
VarG

(4,67)-(4,68)
x
VarG

*)
