
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
(8,5)-(8,15)
(8,21)-(8,61)
(8,27)-(8,40)
(8,32)-(8,33)
(8,52)-(8,53)
(8,56)-(8,57)
(8,58)-(8,59)
(8,67)-(8,68)
*)

(* type error slice
(2,3)-(5,27)
(2,12)-(5,25)
(4,28)-(4,34)
(4,28)-(4,47)
(4,35)-(4,41)
(4,36)-(4,37)
(4,42)-(4,47)
(4,43)-(4,44)
(5,2)-(5,8)
(5,2)-(5,25)
(5,9)-(5,15)
(5,10)-(5,11)
(5,16)-(5,25)
(5,17)-(5,18)
(8,44)-(8,50)
(8,44)-(8,61)
(8,51)-(8,61)
(8,52)-(8,53)
(8,55)-(8,60)
(8,56)-(8,57)
*)
