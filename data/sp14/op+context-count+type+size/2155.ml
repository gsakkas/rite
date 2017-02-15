
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) =
  if b != (f b) then let f = ((f b), true) in wwhile (f, (f b)) else b;;


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
(8,21)-(8,63)
(8,29)-(8,42)
(8,54)-(8,55)
(8,58)-(8,59)
(8,60)-(8,61)
(8,69)-(8,70)
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
(8,21)-(8,63)
(8,29)-(8,42)
(8,46)-(8,52)
(8,46)-(8,63)
(8,53)-(8,63)
(8,54)-(8,55)
(8,57)-(8,62)
(8,58)-(8,59)
*)
