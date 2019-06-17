
let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) = wwhile ((wwhile (f, b)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile
    ((let g b = let t = f b in if b = t then (b, false) else (t, true) in g),
      b);;

*)

(* changed spans
(5,30)-(5,45)
let g =
  fun b ->
    (let t = f b in
     if b = t
     then (b , false)
     else (t , true)) in
g
LetG NonRec [(VarPatG,LamG EmptyPatG EmptyG)] VarG

*)

(* type error slice
(3,3)-(3,66)
(3,9)-(3,10)
(3,9)-(3,12)
(3,29)-(3,66)
(3,46)-(3,52)
(3,46)-(3,59)
(3,53)-(3,59)
(3,54)-(3,55)
(3,65)-(3,66)
(5,22)-(5,28)
(5,22)-(5,49)
(5,29)-(5,49)
(5,30)-(5,45)
(5,31)-(5,37)
*)
