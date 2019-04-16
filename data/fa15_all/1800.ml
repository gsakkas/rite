
let rec wwhile (f,b) = let (i,t) = f b in if t then wwhile (f, i) else i;;

let fixpoint (f,b) = wwhile (((f b) = b), b);;


(* fix

let rec wwhile (f,b) = let (i,t) = f b in if t then wwhile (f, i) else i;;

let fixpoint (f,b) =
  wwhile
    ((let g b = let xx = f b in if b = xx then (xx, false) else (xx, true) in
      g), b);;

*)

(* changed spans
(4,30)-(4,41)
let g =
  fun b ->
    (let xx = f b in
     if b = xx
     then (xx , false)
     else (xx , true)) in
g
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) VarG

*)

(* type error slice
(2,36)-(2,37)
(2,36)-(2,39)
(2,53)-(2,59)
(2,53)-(2,66)
(2,60)-(2,66)
(2,61)-(2,62)
(4,22)-(4,28)
(4,22)-(4,45)
(4,29)-(4,45)
(4,30)-(4,41)
*)
