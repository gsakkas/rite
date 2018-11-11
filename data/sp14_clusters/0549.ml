
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (if (f b) = b then ((f b), false) else ((failwith "asd"), b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b
      then fun b''  -> ((f b), false)
      else (fun b''  -> ((f b), true))), b);;

*)

(* changed spans
(5,9)-(5,70)
(if f b = b
 then (fun b'' ->
         (f b , false))
 else (fun b'' ->
         (f b , true)) , b)
TupleG [IteG EmptyG EmptyG EmptyG,VarG]

(5,28)-(5,42)
fun b'' -> (f b , false)
LamG (TupleG [EmptyG,EmptyG])

(5,48)-(5,69)
fun b'' -> (f b , true)
LamG (TupleG [EmptyG,EmptyG])

(5,59)-(5,64)
f
VarG

*)
