
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let rec fs x = ((fs x), ((f b) = b)) in wwhile (fs, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let fs x = ((f b), ((f b) = b)) in wwhile (fs, b);;

*)

(* changed spans
(6,21)-(6,75)
let fs =
  fun x -> (f b , f b = b) in
wwhile (fs , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(6,37)-(6,43)
b
VarG

(6,41)-(6,42)
f
VarG

*)
