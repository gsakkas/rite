
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) =
  if b != (f b)
  then let f b = (b, true) in wwhile (f, (f b))
  else wwhile (f b);;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) =
  if b = (f b) then f b else (let g b = ((f b), true) in wwhile (g, (f b)));;

*)

(* changed spans
(8,6)-(8,16)
b = f b
BopG VarG (AppG [EmptyG])

(9,8)-(9,48)
f b
AppG [VarG]

(10,8)-(10,20)
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
(8,6)-(8,7)
(8,6)-(8,16)
(8,11)-(8,16)
(8,12)-(8,13)
(9,31)-(9,37)
(9,31)-(9,48)
(9,38)-(9,48)
(9,39)-(9,40)
(9,42)-(9,47)
(9,43)-(9,44)
(9,45)-(9,46)
(10,8)-(10,14)
(10,8)-(10,20)
(10,15)-(10,20)
(10,16)-(10,17)
*)
