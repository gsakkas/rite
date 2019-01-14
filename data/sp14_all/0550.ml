
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile ((if (f b) = b then ((f b), false) else failwith "asd"), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b
      then fun b''  -> ((f b), false)
      else (fun b''  -> ((f b), true))), b);;

*)

(* changed spans
(5,29)-(5,43)
fun b'' -> (f b , false)
LamG (TupleG (fromList [EmptyG]))

(5,49)-(5,63)
fun b'' -> (f b , true)
LamG (TupleG (fromList [EmptyG]))

(5,49)-(5,63)
(f b , true)
TupleG (fromList [AppG (fromList [EmptyG]),LitG])

(5,58)-(5,63)
f
VarG

*)
