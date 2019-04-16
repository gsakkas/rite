
let rec wwhile (f,b) =
  let x = wwhile (f, b) in
  let h::t = x in
  let r::l = t in match r with | false  -> h | true  -> wwhile (f, h);;


(* fix

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

*)

(* changed spans
(3,3)-(5,70)
let (x , y) = f b in
match y with
| false -> x
| true -> wwhile (f , x)
LetG NonRec (fromList [(TuplePatG (fromList [VarPatG]),AppG (fromList [EmptyG]))]) (CaseG EmptyG (fromList [(LitPatG,Nothing,EmptyG)]))

*)

(* type error slice
(3,3)-(5,70)
(3,11)-(3,17)
(3,11)-(3,24)
(4,3)-(5,70)
(4,14)-(4,15)
(5,19)-(5,70)
(5,44)-(5,45)
(5,57)-(5,63)
(5,57)-(5,70)
*)
