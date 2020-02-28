
let fp f b = let (i,t) = f b in if i = b then b;;

let rec wwhile (f,b) = let (i,t) = f b in if t then wwhile (f, i) else i;;

let fixpoint (f,b) = wwhile ((fp f b), b);;


(* fix

let rec wwhile (f,b) = let (i,t) = f b in if t then wwhile (f, i) else i;;

let fixpoint (f,b) =
  wwhile
    ((let g b = let xx = f b in if b = xx then (xx, false) else (xx, true) in
      g), b);;

*)

(* changed spans
(6,30)-(6,38)
let g =
  fun b ->
    (let xx = f b in
     if b = xx
     then (xx , false)
     else (xx , true)) in
g
LetG NonRec [(VarPatG,LamG EmptyPatG EmptyG)] VarG

*)

(* type error slice
(2,4)-(2,50)
(2,8)-(2,48)
(2,10)-(2,48)
(2,14)-(2,48)
(2,33)-(2,48)
(2,48)-(2,48)
(4,36)-(4,37)
(4,36)-(4,39)
(4,53)-(4,59)
(4,53)-(4,66)
(4,60)-(4,66)
(4,61)-(4,62)
(6,22)-(6,28)
(6,22)-(6,42)
(6,29)-(6,42)
(6,30)-(6,38)
(6,31)-(6,33)
*)
