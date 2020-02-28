
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let fb = f b in ((fb, (fb = b)), b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let w b' = let fb = f b' in (fb, (fb = b')) in wwhile (w, b);;

*)

(* changed spans
(4,22)-(4,66)
let w =
  fun b' ->
    (let fb = f b' in
     (fb , fb = b')) in
wwhile (w , b)
LetG NonRec [(VarPatG,LamG EmptyPatG EmptyG)] (AppG [EmptyG])

*)

(* type error slice
(2,38)-(2,39)
(2,38)-(2,41)
(2,56)-(2,62)
(2,56)-(2,70)
(2,63)-(2,70)
(2,64)-(2,65)
(4,22)-(4,28)
(4,22)-(4,66)
(4,29)-(4,66)
(4,46)-(4,65)
(4,47)-(4,61)
*)
