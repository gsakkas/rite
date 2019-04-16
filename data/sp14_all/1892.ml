
let g (f,x) = let xx = f x in (xx, (xx = (f x)));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((g f b), b);;


(* fix

let g h x = let xx = h x in (xx, (xx = (h x)));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((g f), b);;

*)

(* changed spans
(2,8)-(2,49)
fun h ->
  fun x ->
    (let xx = h x in
     (xx , xx = h x))
LamG VarPatG (LamG VarPatG EmptyG)

(6,30)-(6,37)
g f
AppG (fromList [VarG])

*)

(* type error slice
(2,4)-(2,51)
(2,8)-(2,49)
(2,15)-(2,49)
(2,31)-(2,49)
(6,30)-(6,37)
(6,31)-(6,32)
*)
