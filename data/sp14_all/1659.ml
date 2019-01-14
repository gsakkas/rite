
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
(8,25)-(8,62)
fun b' ->
  (let fOfB = f' b' in
   (fOfB , fOfB = b'))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(8,39)-(8,40)
b'
VarG

(8,59)-(8,60)
b'
VarG

*)
