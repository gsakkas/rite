
let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let x = 1.0;;

let fixpoint (f,b) =
  wwhile (let y x = let xx = f x in (xx, (xx != x)) in ((y x), b));;


(* fix

let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) =
  wwhile (let y x = let xx = f x in (xx, (xx != x)) in (y, b));;

*)

(* changed spans
(9,57)-(9,62)
y
VarG

*)

(* type error slice
(3,26)-(3,27)
(3,26)-(3,29)
(4,19)-(4,25)
(4,19)-(4,37)
(4,26)-(4,37)
(4,27)-(4,28)
(9,3)-(9,9)
(9,3)-(9,67)
(9,10)-(9,67)
(9,17)-(9,52)
(9,21)-(9,52)
(9,37)-(9,52)
(9,56)-(9,66)
(9,57)-(9,62)
(9,58)-(9,59)
*)
