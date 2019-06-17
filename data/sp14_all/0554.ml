
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b
      then ((failwith "Asd"), (failwith "asd"))
      else failwith "asd"), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b
      then fun b''  -> ((f b), false)
      else (fun b''  -> ((f b), true))), b);;

*)

(* changed spans
(7,12)-(7,48)
fun b'' -> (f b , false)
LamG VarPatG (TupleG [EmptyG,EmptyG])

(8,12)-(8,26)
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
(5,3)-(8,31)
(6,5)-(8,31)
(6,6)-(8,27)
(7,12)-(7,48)
*)
