
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let fx b = if b = 0 then 0 else if b > 1 then b - 1 else b + 1 in
  wwhile (fx, f);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(7,2)-(8,16)
let funt =
  fun b ->
    if f b
    then (b , true)
    else (b , false) in
wwhile (funt , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(7,27)-(7,28)
f
VarG

(7,37)-(7,42)
f b
AppG (fromList [VarG])

(7,48)-(7,49)
(b , false)
TupleG (fromList [VarG,LitG])

(7,48)-(7,53)
(b , true)
TupleG (fromList [VarG,LitG])

(7,59)-(7,64)
true
LitG

(7,63)-(7,64)
false
LitG

(8,9)-(8,16)
b
VarG

(8,14)-(8,15)
funt
VarG

*)
