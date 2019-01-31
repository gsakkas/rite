
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let fs bs = if bs = 0 then 0 else if bs > 1 then bs - 1 else bs + 1 in
  wwhile ((fs b true), b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(7,17)-(7,19)
fun b ->
  if f b
  then (b , true)
  else (b , false)
LamG (IteG EmptyG EmptyG EmptyG)

(7,29)-(7,30)
let funt =
  fun b ->
    if f b
    then (b , true)
    else (b , false) in
wwhile (funt , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(7,68)-(7,69)
b
VarG

(8,2)-(8,8)
f
VarG

(8,11)-(8,13)
(b , false)
TupleG (fromList [VarG,LitG])

(8,14)-(8,15)
wwhile
VarG

(8,14)-(8,15)
funt
VarG

(8,14)-(8,15)
b
VarG

(8,14)-(8,15)
wwhile (funt , b)
AppG (fromList [TupleG (fromList [EmptyG])])

(8,14)-(8,15)
false
LitG

(8,14)-(8,15)
(funt , b)
TupleG (fromList [VarG])

*)
