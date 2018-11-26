
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile ((if (f b) = b then (b, (failwith "asd")) else failwith "asd"), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b
      then fun b''  -> ((f b), false)
      else (fun b''  -> ((f b), true))), b);;

*)

(* changed spans
(5,29)-(5,50)
fun b'' -> (f b , false)
LamG (TupleG (fromList [EmptyG]))

(5,43)-(5,48)
f
VarG

(5,56)-(5,70)
b
VarG

(5,56)-(5,70)
fun b'' -> (f b , true)
LamG (TupleG (fromList [EmptyG]))

(5,56)-(5,70)
false
LitG

(5,56)-(5,70)
(f b , true)
TupleG (fromList [AppG (fromList [EmptyG]),LitG])

(5,65)-(5,70)
f
VarG

*)
