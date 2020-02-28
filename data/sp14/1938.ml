
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let y x = ((f b), (b = (f b))) in wwhile ((y b), b);;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let y x = ((f b), (b = (f b))) in wwhile (y, b);;

*)

(* changed spans
(7,64)-(7,69)
y
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
(7,22)-(7,73)
(7,28)-(7,52)
(7,32)-(7,52)
(7,56)-(7,62)
(7,56)-(7,73)
(7,63)-(7,73)
(7,64)-(7,69)
(7,65)-(7,66)
*)
