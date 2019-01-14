
let rec wwhile (f,b) = if snd f b then wwhile f fst f b else fst f b;;


(* fix

let rec wwhile (f,b) =
  if snd (f b) then wwhile (f, (fst (f b))) else fst (f b);;

*)

(* changed spans
(2,26)-(2,33)
snd (f b)
AppG (fromList [AppG (fromList [EmptyG])])

(2,30)-(2,31)
f b
AppG (fromList [VarG])

(2,39)-(2,55)
wwhile (f , fst (f b))
AppG (fromList [TupleG (fromList [EmptyG])])

(2,46)-(2,47)
(f , fst (f b))
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(2,48)-(2,51)
fst (f b)
AppG (fromList [AppG (fromList [EmptyG])])

(2,52)-(2,53)
f b
AppG (fromList [VarG])

(2,61)-(2,68)
fst (f b)
AppG (fromList [AppG (fromList [EmptyG])])

(2,65)-(2,66)
f b
AppG (fromList [VarG])

*)
