
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((let g b = (f, ((f b) = b)) in g), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (let g x = let calcfx = f x in (calcfx, (calcfx = x)) in (g, b));;

*)

(* changed spans
(4,29)-(4,67)
let g =
  fun x ->
    (let calcfx = f x in
     (calcfx , calcfx = x)) in
(g , b)
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (TupleG (fromList [EmptyG]))

*)

(* type error slice
(2,4)-(2,80)
(2,17)-(2,78)
(2,24)-(2,78)
(2,38)-(2,39)
(2,38)-(2,41)
(2,40)-(2,41)
(2,56)-(2,62)
(2,56)-(2,70)
(2,63)-(2,70)
(2,67)-(2,69)
(4,22)-(4,28)
(4,22)-(4,67)
(4,29)-(4,67)
(4,30)-(4,63)
(4,37)-(4,57)
(4,41)-(4,57)
(4,42)-(4,43)
(4,46)-(4,51)
(4,47)-(4,48)
(4,49)-(4,50)
(4,61)-(4,62)
*)
