
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
(5,10)-(5,71)
(if f b = b
 then (fun b'' ->
         (f b , false))
 else (fun b'' ->
         (f b , true)) , b)
TupleG [IteG EmptyG EmptyG EmptyG,VarG]

*)

(* type error slice
(2,38)-(2,39)
(2,38)-(2,41)
(2,56)-(2,62)
(2,56)-(2,70)
(2,63)-(2,70)
(2,64)-(2,65)
(5,3)-(5,9)
(5,3)-(5,71)
(5,10)-(5,71)
(5,14)-(5,19)
(5,14)-(5,23)
(5,15)-(5,16)
(5,22)-(5,23)
(5,29)-(5,43)
(5,30)-(5,35)
(5,31)-(5,32)
(5,37)-(5,42)
(5,49)-(5,70)
(5,68)-(5,69)
*)
