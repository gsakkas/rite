
let rec wwhile (f,b) =
  let x y = (f, b) in if b = true then wwhile (f, x) else x;;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

*)

(* changed spans
(3,12)-(3,18)
let res = f b in
match res with
| (x , y) when y = true -> wwhile (f , x)
| (x , y) -> x
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (CaseG EmptyG (fromList [(Nothing,EmptyG),(Just EmptyG,EmptyG)]))

(3,13)-(3,14)
f b
AppG (fromList [VarG])

(3,29)-(3,33)
match res with
| (x , y) when y = true -> wwhile (f , x)
| (x , y) -> x
CaseG VarG (fromList [(Nothing,VarG),(Just (BopG EmptyG EmptyG),AppG (fromList [EmptyG]))])

(3,39)-(3,52)
res
VarG

*)
