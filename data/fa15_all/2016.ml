
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | true  -> wwhile (f, b');;

let fixpoint (f,b) =
  let f' x = if (f x) = b then f x else f (x + 1) in wwhile (f', b);;


(* fix

let fixpoint (f,b) = let rec g x = if (f x) = b then x else g (x + 1) in g 0;;

*)

(* changed spans
(6,2)-(6,67)
let rec g =
  fun x ->
    if f x = b
    then x
    else g (x + 1) in
g 0
LetG Rec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(6,40)-(6,41)
g
VarG

(6,65)-(6,66)
g
VarG

*)
