
let rec wwhile (f,b) =
  match f b with | (b',c) -> if c = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((let b = f b in (b, (b != b))), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c) -> if c = true then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile ((fun fixb  -> let b = f b in (b, (fixb != b))), b);;

*)

(* changed spans
(5,29)-(5,59)
fun fixb ->
  (let b = f b in
   (b , fixb <> b))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(5,50)-(5,51)
fixb
VarG

*)
