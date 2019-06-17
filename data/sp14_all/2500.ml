
let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) = wwhile ((let k x = (f x) = x in f b), b);;


(* fix

let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let g x = let xx = f x in (xx, (xx != b)) in g), b);;

*)

(* changed spans
(7,30)-(7,58)
let g =
  fun x ->
    (let xx = f x in
     (xx , xx <> b)) in
g
LetG NonRec [(VarPatG,LamG EmptyPatG EmptyG)] VarG

*)

(* type error slice
(2,4)-(5,17)
(2,17)-(5,15)
(4,5)-(4,66)
(4,19)-(4,20)
(4,19)-(4,22)
(4,53)-(4,61)
(4,53)-(4,66)
(4,62)-(4,63)
(4,64)-(4,66)
(5,3)-(5,11)
(5,3)-(5,15)
(5,12)-(5,13)
(5,14)-(5,15)
(7,22)-(7,28)
(7,22)-(7,62)
(7,29)-(7,62)
(7,30)-(7,58)
(7,41)-(7,46)
(7,41)-(7,50)
(7,42)-(7,43)
(7,44)-(7,45)
(7,49)-(7,50)
(7,54)-(7,55)
(7,54)-(7,57)
(7,56)-(7,57)
(7,60)-(7,61)
*)
