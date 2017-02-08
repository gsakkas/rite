
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let g b = b in wwhile (g, b);;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let g b = (b, (f b)) in wwhile (g, b);;

*)

(* changed spans
(7,32)-(7,33)
(7,37)-(7,43)
(7,45)-(7,46)
(7,48)-(7,49)
*)

(* type error slice
(2,4)-(5,28)
(2,13)-(5,25)
(3,3)-(5,25)
(3,19)-(4,62)
(4,29)-(4,35)
(4,29)-(4,47)
(4,44)-(4,45)
(4,44)-(4,47)
(4,46)-(4,47)
(5,3)-(5,9)
(5,3)-(5,25)
(5,11)-(5,12)
(5,11)-(5,15)
(5,14)-(5,15)
(5,18)-(5,19)
(5,18)-(5,25)
(7,22)-(7,49)
(7,28)-(7,33)
(7,32)-(7,33)
(7,37)-(7,43)
(7,37)-(7,49)
(7,45)-(7,46)
(7,45)-(7,49)
*)
