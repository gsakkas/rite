
let rec wwhile (f,b) =
  match f with
  | (x,y) -> let (x,y) = f b in if y = true then wwhile (f, x) else x;;


(* fix

let rec wwhile (f,b) =
  let (x,y) = f b in if y = true then wwhile (f, x) else x;;

*)

(* changed spans
(3,3)-(4,70)
let (x , y) = f b in
if y = true
then wwhile (f , x)
else x
LetG NonRec (fromList [(TuplePatG (fromList [VarPatG]),AppG (fromList [EmptyG]))]) (IteG EmptyG EmptyG EmptyG)

*)

(* type error slice
(3,3)-(4,70)
(3,9)-(3,10)
(4,26)-(4,27)
(4,26)-(4,29)
*)
