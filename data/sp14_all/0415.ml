
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile ((let w b' = let fb = f b' in (fb, (fb = b')) in f b), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let w b' = let fb = f b' in (fb, (fb = b')) in wwhile (w, b);;

*)

(* changed spans
(5,3)-(5,67)
let w =
  fun b' ->
    (let fb = f b' in
     (fb , fb = b')) in
wwhile (w , b)
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (AppG (fromList [EmptyG]))

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
(5,3)-(5,67)
(5,10)-(5,67)
(5,11)-(5,63)
(5,23)-(5,55)
(5,32)-(5,33)
(5,32)-(5,36)
(5,34)-(5,36)
(5,45)-(5,54)
(5,46)-(5,48)
(5,51)-(5,53)
(5,59)-(5,60)
(5,59)-(5,62)
(5,61)-(5,62)
(5,65)-(5,66)
*)
