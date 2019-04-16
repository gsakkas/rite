
let rec wwhile (f,b) = wwhile ((f b), b);;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  let (b',c') = temp in if c' = true then wwhile (f, b') else b';;

*)

(* changed spans
(2,24)-(2,41)
let temp = f b in
let (b' , c') = temp in
if c' = true
then wwhile (f , b')
else b'
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (LetG NonRec (fromList [(TuplePatG (fromList [EmptyPatG]),EmptyG)]) EmptyG)

*)

(* type error slice
(2,4)-(2,43)
(2,17)-(2,41)
(2,24)-(2,30)
(2,24)-(2,41)
(2,31)-(2,41)
(2,32)-(2,37)
(2,33)-(2,34)
*)
