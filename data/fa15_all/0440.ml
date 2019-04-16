
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
(6,22)-(6,76)
let fs =
  fun x -> (f b , f b = b) in
wwhile (fs , b)
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (AppG (fromList [EmptyG]))

*)

(* type error slice
(6,22)-(6,76)
(6,33)-(6,58)
(6,37)-(6,58)
(6,38)-(6,44)
(6,39)-(6,41)
*)
