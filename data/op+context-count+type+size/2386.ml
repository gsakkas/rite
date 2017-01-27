
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) =
  if b != (f b) then let f b = (b, true) in wwhile (f, (f b)) else b;;


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
(8,22)-(8,60)
(8,33)-(8,34)
(8,53)-(8,54)
(8,57)-(8,58)
(8,59)-(8,60)
(8,68)-(8,69)
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
(8,6)-(8,7)
(8,6)-(8,15)
(8,22)-(8,60)
(8,28)-(8,40)
(8,33)-(8,34)
(8,33)-(8,40)
(8,36)-(8,40)
(8,45)-(8,51)
(8,45)-(8,60)
(8,53)-(8,54)
(8,53)-(8,60)
(8,57)-(8,58)
(8,57)-(8,60)
(8,59)-(8,60)
*)
