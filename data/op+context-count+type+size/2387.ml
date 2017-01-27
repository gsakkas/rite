
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = if b != (f b) then let b = f b in wwhile (f, b) else b;;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) =
  if b = (f b) then f b else (let g b = ((f b), true) in wwhile (g, (f b)));;

*)

(* changed spans
(7,25)-(7,34)
(7,41)-(7,68)
(7,56)-(7,62)
(7,56)-(7,68)
(7,64)-(7,65)
(7,64)-(7,68)
(7,75)-(7,76)
*)

(* type error slice
(2,4)-(5,28)
(2,13)-(5,25)
(3,3)-(5,25)
(4,29)-(4,35)
(4,29)-(4,47)
(4,37)-(4,38)
(4,37)-(4,41)
(4,40)-(4,41)
(5,3)-(5,9)
(5,3)-(5,25)
(5,11)-(5,12)
(5,11)-(5,15)
(5,14)-(5,15)
(5,18)-(5,19)
(5,18)-(5,25)
(5,21)-(5,25)
(7,31)-(7,32)
(7,31)-(7,34)
(7,33)-(7,34)
(7,41)-(7,68)
(7,56)-(7,62)
(7,56)-(7,68)
(7,64)-(7,65)
(7,64)-(7,68)
(7,67)-(7,68)
*)
