
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let g x = (f, (b = (f b))) in wwhile (g, (f b));;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let g x = ((f b), (b = (f b))) in wwhile (g, b);;

*)

(* changed spans
(7,33)-(7,34)
f b
AppG (fromList [VarG])

(7,63)-(7,68)
b
VarG

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
(7,22)-(7,69)
(7,28)-(7,48)
(7,32)-(7,48)
(7,33)-(7,34)
(7,52)-(7,58)
(7,52)-(7,69)
(7,59)-(7,69)
(7,60)-(7,61)
(7,63)-(7,68)
(7,64)-(7,65)
*)
