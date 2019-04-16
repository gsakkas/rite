
let rec fix t x = if x = (t x) then x else t x;;

let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) = wwhile ((fix b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile
    ((let g b = let t = f b in if b = t then (b, false) else (t, true) in g),
      b);;

*)

(* changed spans
(7,30)-(7,37)
let g =
  fun b ->
    (let t = f b in
     if b = t
     then (b , false)
     else (t , true)) in
g
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) VarG

*)

(* type error slice
(2,4)-(2,49)
(2,13)-(2,47)
(2,15)-(2,47)
(2,44)-(2,45)
(2,44)-(2,47)
(2,46)-(2,47)
(4,4)-(5,68)
(4,17)-(5,66)
(5,9)-(5,10)
(5,9)-(5,12)
(5,11)-(5,12)
(7,22)-(7,28)
(7,22)-(7,41)
(7,29)-(7,41)
(7,30)-(7,37)
(7,31)-(7,34)
(7,35)-(7,36)
(7,39)-(7,40)
*)
