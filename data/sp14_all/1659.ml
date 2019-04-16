
let rec wwhile (f,b) =
  let f' = f b in
  match f' with | (b',false ) -> b' | (b',true ) -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((let whilesFun f' = let fOfB = f' b in (fOfB, (fOfB = b)) in whilesFun f),
      b);;


(* fix

let rec wwhile (f,b) =
  let f' = f b in
  match f' with | (b',false ) -> b' | (b',true ) -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((let whilesFun f' b' = let fOfB = f' b' in (fOfB, (fOfB = b')) in
      whilesFun f), b);;

*)

(* changed spans
(8,26)-(8,63)
fun b' ->
  (let fOfB = f' b' in
   (fOfB , fOfB = b'))
LamG VarPatG (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)

*)

(* type error slice
(3,12)-(3,13)
(3,12)-(3,15)
(4,53)-(4,59)
(4,53)-(4,67)
(4,60)-(4,67)
(4,61)-(4,62)
(7,3)-(7,9)
(7,3)-(9,9)
(8,5)-(9,9)
(8,6)-(8,79)
(8,21)-(8,63)
(8,26)-(8,63)
(8,45)-(8,63)
(8,67)-(8,76)
(8,67)-(8,78)
*)
