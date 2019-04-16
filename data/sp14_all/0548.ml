
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (if (f b) = b then ((f b), false) else (((f b), true), b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b
      then fun b''  -> ((f b), false)
      else (fun b''  -> ((f b), true))), b);;

*)

(* changed spans
(5,10)-(5,68)
(if f b = b
 then (fun b'' ->
         (f b , false))
 else (fun b'' ->
         (f b , true)) , b)
TupleG (fromList [VarG,IteG EmptyG EmptyG EmptyG])

*)

(* type error slice
(5,10)-(5,68)
(5,29)-(5,43)
(5,30)-(5,35)
(5,31)-(5,32)
(5,49)-(5,67)
(5,50)-(5,63)
(5,51)-(5,56)
(5,52)-(5,53)
*)
