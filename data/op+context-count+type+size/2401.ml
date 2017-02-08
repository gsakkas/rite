
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
(7,65)-(7,68)
(7,71)-(7,72)
*)

(* type error slice
(2,4)-(5,28)
(2,13)-(5,25)
(4,29)-(4,35)
(4,29)-(4,47)
(4,37)-(4,38)
(4,37)-(4,41)
(4,44)-(4,45)
(4,44)-(4,47)
(5,3)-(5,9)
(5,3)-(5,25)
(5,11)-(5,12)
(5,11)-(5,15)
(7,22)-(7,72)
(7,28)-(7,49)
(7,34)-(7,49)
(7,56)-(7,62)
(7,56)-(7,72)
(7,65)-(7,66)
(7,65)-(7,68)
(7,65)-(7,72)
*)
