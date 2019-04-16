
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
(5,30)-(5,51)
fun b'' -> (f b , false)
LamG VarPatG (TupleG (fromList [EmptyG]))

(5,57)-(5,71)
fun b'' -> (f b , true)
LamG VarPatG (TupleG (fromList [EmptyG]))

*)

(* type error slice
(2,38)-(2,39)
(2,38)-(2,41)
(2,56)-(2,62)
(2,56)-(2,70)
(2,63)-(2,70)
(2,64)-(2,65)
(5,3)-(5,9)
(5,3)-(5,76)
(5,10)-(5,76)
(5,11)-(5,72)
(5,30)-(5,51)
*)
