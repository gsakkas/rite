
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b then ((failwith "asd"), true) else failwith "asd"), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b
      then fun b''  -> ((f b), false)
      else (fun b''  -> ((f b), true))), b);;

*)

(* changed spans
(6,25)-(6,49)
fun b'' -> (f b , false)
LamG VarPatG (TupleG [EmptyG,EmptyG])

(6,55)-(6,69)
fun b'' -> (f b , true)
LamG VarPatG (TupleG [EmptyG,EmptyG])

*)

(* type error slice
(2,38)-(2,39)
(2,38)-(2,41)
(2,56)-(2,62)
(2,56)-(2,70)
(2,63)-(2,70)
(2,64)-(2,65)
(5,3)-(5,9)
(5,3)-(6,74)
(6,5)-(6,74)
(6,6)-(6,70)
(6,25)-(6,49)
*)
