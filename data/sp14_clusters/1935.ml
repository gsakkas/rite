
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let f x = ((f b), (b = (f b))) in wwhile (f, (f b));;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let g x = ((f b), (b = (f b))) in wwhile (g, (f b));;

*)

(* changed spans
(7,21)-(7,72)
let g =
  fun x -> (f b , b = f b) in
wwhile (g , f b)
LetG NonRec [LamG EmptyG] (AppG [EmptyG])

(7,63)-(7,64)
g
VarG

*)
