
let rec wwhile (f,b) =
  match (f, b) with | (f,(h1,h2)) -> if h2 then wwhile (f, h1) else h1;;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

*)

(* changed spans
(3,3)-(3,71)
match f b with
| (h1 , h2) -> if h2
               then wwhile (f , h1)
               else h1
CaseG (AppG (fromList [EmptyG])) (fromList [(TuplePatG (fromList [VarPatG]),Nothing,IteG EmptyG EmptyG EmptyG)])

*)

(* type error slice
(2,4)-(3,73)
(2,17)-(3,71)
(3,3)-(3,71)
(3,9)-(3,15)
(3,13)-(3,14)
(3,49)-(3,55)
(3,49)-(3,63)
(3,56)-(3,63)
(3,60)-(3,62)
*)
