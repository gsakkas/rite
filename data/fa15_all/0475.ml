
let rec wwhile (f,b) =
  let x y = (f, b) in if b = true then wwhile (f, x) else x;;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

*)

(* changed spans
(3,3)-(3,60)
let res = f b in
match res with
| (x , y) when y = true -> wwhile (f , x)
| (x , y) -> x
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (CaseG EmptyG (fromList [(TuplePatG (fromList [EmptyPatG]),Nothing,EmptyG),(TuplePatG (fromList [EmptyPatG]),Just EmptyG,EmptyG)]))

*)

(* type error slice
(2,4)-(3,62)
(2,17)-(3,60)
(3,3)-(3,60)
(3,9)-(3,19)
(3,26)-(3,27)
(3,26)-(3,34)
(3,30)-(3,34)
(3,40)-(3,46)
(3,40)-(3,53)
(3,47)-(3,53)
(3,51)-(3,52)
*)
