
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = if b != (f b) then wwhile (f, (f b)) else b;;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) =
  if b = (f b) then f b else (let g b = ((f b), true) in wwhile (g, (f b)));;

*)

(* changed spans
(7,25)-(7,35)
b = f b
BopG VarG (AppG [EmptyG])

(7,41)-(7,58)
f b
AppG [VarG]

(7,64)-(7,65)
let g =
  fun b -> (f b , true) in
wwhile (g , f b)
LetG NonRec [(VarPatG,LamG EmptyPatG EmptyG)] (AppG [EmptyG])

*)

(* type error slice
(2,4)-(5,28)
(2,13)-(5,26)
(4,29)-(4,35)
(4,29)-(4,48)
(4,36)-(4,42)
(4,37)-(4,38)
(4,43)-(4,48)
(4,44)-(4,45)
(5,3)-(5,9)
(5,3)-(5,26)
(5,10)-(5,16)
(5,11)-(5,12)
(5,17)-(5,26)
(5,18)-(5,19)
(7,41)-(7,47)
(7,41)-(7,58)
(7,48)-(7,58)
(7,49)-(7,50)
(7,52)-(7,57)
(7,53)-(7,54)
*)
