
let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((match f b with | b -> b | _ -> (f, b)), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let f' b = ((f b), (b = (f b))) in f'), b);;

*)

(* changed spans
(5,30)-(5,69)
let f' =
  fun b -> (f b , b = f b) in
f'
LetG NonRec [(VarPatG,LamG EmptyPatG EmptyG)] VarG

*)

(* type error slice
(5,30)-(5,69)
(5,37)-(5,38)
(5,37)-(5,40)
(5,53)-(5,54)
(5,62)-(5,68)
(5,63)-(5,64)
*)
