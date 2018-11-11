
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b then (true, (failwith "asd")) else failwith "asd"), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b
      then fun b''  -> ((f b), false)
      else (fun b''  -> ((f b), true))), b);;

*)

(* changed spans
(6,24)-(6,48)
fun b'' -> (f b , false)
LamG (TupleG [EmptyG,EmptyG])

(6,41)-(6,46)
f
VarG

(6,54)-(6,68)
b
VarG

(6,54)-(6,68)
fun b'' -> (f b , true)
LamG (TupleG [EmptyG,EmptyG])

(6,54)-(6,68)
false
LitG

(6,54)-(6,68)
(f b , true)
TupleG [AppG [EmptyG],LitG]

(6,63)-(6,68)
f
VarG

*)
