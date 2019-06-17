
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile ((let w b = let fb = f b in (fb, (fb = b)) in f b), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let w b' = let fb = f b' in (fb, (fb = b')) in wwhile (w, b);;

*)

(* changed spans
(5,3)-(5,64)
let w =
  fun b' ->
    (let fb = f b' in
     (fb , fb = b')) in
wwhile (w , b)
LetG NonRec [(VarPatG,LamG EmptyPatG EmptyG)] (AppG [EmptyG])

*)

(* type error slice
(2,24)-(2,78)
(2,38)-(2,39)
(2,38)-(2,41)
(2,56)-(2,62)
(2,56)-(2,70)
(2,63)-(2,70)
(2,64)-(2,65)
(2,67)-(2,69)
(5,3)-(5,9)
(5,3)-(5,64)
(5,10)-(5,64)
(5,11)-(5,60)
(5,22)-(5,52)
(5,31)-(5,32)
(5,31)-(5,34)
(5,33)-(5,34)
(5,43)-(5,51)
(5,44)-(5,46)
(5,49)-(5,50)
(5,56)-(5,57)
(5,56)-(5,59)
(5,58)-(5,59)
(5,62)-(5,63)
*)
