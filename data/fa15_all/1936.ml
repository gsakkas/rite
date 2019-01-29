
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let g x = (f, (b = (f b))) in wwhile (g, (f b));;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let g x = ((f b), (b = (f b))) in wwhile (g, b);;

*)

(* changed spans
(7,32)-(7,33)
f b
AppG (fromList [VarG])

(7,35)-(7,46)
b
VarG

*)
