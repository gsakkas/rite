
let rec wwhile (f,b) =
  let (f',b') = f b in if b' = true then wwhile (f, f') else f';;

let fixpoint (f,b) = wwhile ((let h x = ((f b), ((f b) != b)) in f), b);;


(* fix

let rec wwhile (f,b) =
  let (f',b') = f b in if b' = true then wwhile (f, f') else f';;

let fixpoint (f,b) = wwhile ((let h x = ((f b), ((f b) != b)) in h), b);;

*)

(* changed spans
(5,66)-(5,67)
h
VarG

*)

(* type error slice
(3,3)-(3,64)
(3,17)-(3,18)
(3,17)-(3,20)
(3,42)-(3,48)
(3,42)-(3,56)
(3,49)-(3,56)
(3,50)-(3,51)
(3,53)-(3,55)
(5,22)-(5,28)
(5,22)-(5,72)
(5,29)-(5,72)
(5,30)-(5,68)
(5,49)-(5,61)
(5,50)-(5,55)
(5,51)-(5,52)
(5,59)-(5,60)
(5,66)-(5,67)
(5,70)-(5,71)
*)
