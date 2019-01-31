
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let fx x = if x = 0 then 0 else if x > 1 then x - 1 else x + 1 in
  wwhile ((fx b), f);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(7,16)-(7,17)
fun b ->
  if f b
  then (b , true)
  else (b , false)
LamG (IteG EmptyG EmptyG EmptyG)

(7,27)-(7,28)
let funt =
  fun b ->
    if f b
    then (b , true)
    else (b , false) in
wwhile (funt , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(7,63)-(7,64)
b
VarG

(8,2)-(8,8)
f
VarG

(8,2)-(8,20)
b
VarG

(8,2)-(8,20)
b
VarG

(8,2)-(8,20)
true
LitG

(8,2)-(8,20)
false
LitG

(8,2)-(8,20)
(b , false)
TupleG (fromList [VarG,LitG])

(8,9)-(8,20)
funt
VarG

(8,9)-(8,20)
(funt , b)
TupleG (fromList [VarG])

(8,11)-(8,13)
wwhile
VarG

*)
