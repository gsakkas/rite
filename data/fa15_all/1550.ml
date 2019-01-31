
let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile ((let f' b = let b' = f b in (b', (b' = b)) in f' 1), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile ((let f' x = let b' = f b in (b', (b' = b)) in f'), b);;

*)

(* changed spans
(6,18)-(6,52)
fun x ->
  (let b' = f b in
   (b' , b' = b))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

*)
