
let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((match f b with | b -> b | _ -> wwhile (f, b)), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let f' b = ((f b), (b = (f b))) in f'), b);;

*)

(* changed spans
(6,11)-(6,57)
let f' =
  fun b -> (f b , b = f b) in
f'
LetG NonRec [(VarPatG,LamG EmptyPatG EmptyG)] VarG

*)

(* type error slice
(3,3)-(3,59)
(3,16)-(3,17)
(3,16)-(3,19)
(3,23)-(3,59)
(3,37)-(3,39)
(3,45)-(3,51)
(3,45)-(3,59)
(3,52)-(3,59)
(3,53)-(3,54)
(6,3)-(6,9)
(6,3)-(6,61)
(6,10)-(6,61)
(6,11)-(6,57)
(6,18)-(6,19)
(6,18)-(6,21)
(6,34)-(6,35)
(6,43)-(6,49)
(6,43)-(6,56)
(6,50)-(6,56)
(6,51)-(6,52)
*)
