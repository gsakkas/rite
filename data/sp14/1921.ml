
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = wwhile (f, (f b));;


(* fix

let fixpoint (f,b) = f b;;

*)

(* changed spans
(7,22)-(7,39)
f b
AppG [VarG]

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
(7,22)-(7,28)
(7,22)-(7,39)
(7,29)-(7,39)
(7,30)-(7,31)
(7,33)-(7,38)
(7,34)-(7,35)
*)
