
let rec wwhile (f,b) =
  let x = wwhile (f, b) in
  let h::t = x in match t with | false  -> h | true  -> wwhile (f, h);;


(* fix

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

*)

(* changed spans
(3,3)-(4,70)
let (x , y) = f b in
match y with
| false -> x
| true -> wwhile (f , x)
LetG NonRec (fromList [(TuplePatG (fromList [VarPatG]),AppG (fromList [EmptyG]))]) (CaseG EmptyG (fromList [(LitPatG,Nothing,EmptyG)]))

*)

(* type error slice
(3,3)-(4,70)
(3,11)-(3,17)
(3,11)-(3,24)
(4,3)-(4,70)
(4,14)-(4,15)
(4,19)-(4,70)
(4,25)-(4,26)
(4,44)-(4,45)
(4,57)-(4,63)
(4,57)-(4,70)
*)
