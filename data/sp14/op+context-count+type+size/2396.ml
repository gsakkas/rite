
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) =
  if b != (f b) then let f = (f, true) in wwhile (f, (f b)) else b;;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) =
  if b = (f b) then f b else (let g b = ((f b), true) in wwhile (g, (f b)));;

*)

(* changed spans
(8,6)-(8,15)
(8,22)-(8,58)
(8,31)-(8,32)
(8,31)-(8,38)
(8,34)-(8,38)
(8,51)-(8,52)
(8,55)-(8,56)
(8,55)-(8,58)
(8,57)-(8,58)
(8,66)-(8,67)
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
(8,22)-(8,58)
(8,31)-(8,38)
(8,43)-(8,49)
(8,43)-(8,58)
(8,51)-(8,52)
(8,51)-(8,58)
(8,55)-(8,56)
(8,55)-(8,58)
*)
