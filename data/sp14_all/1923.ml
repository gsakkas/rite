
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) =
  let f x = let xx = f x in (xx, (xx != b)) in f wwhile (f, b);;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let g b = (b, (f b)) in wwhile (g, b);;

*)

(* changed spans
(8,3)-(8,63)
let g = fun b -> (b , f b) in
wwhile (g , b)
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (AppG (fromList [EmptyG]))

*)

(* type error slice
(8,3)-(8,63)
(8,9)-(8,44)
(8,13)-(8,44)
(8,29)-(8,44)
(8,48)-(8,49)
(8,48)-(8,63)
*)
