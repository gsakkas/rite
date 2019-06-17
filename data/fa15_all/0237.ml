
let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) = wwhile (let n x = (f, (x = (f x))) in (n, b));;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) = wwhile (let n x = ((f x), (x = (f x))) in (n, b));;

*)

(* changed spans
(6,41)-(6,42)
f x
AppG [VarG]

*)

(* type error slice
(2,4)-(4,74)
(2,17)-(4,72)
(3,3)-(4,72)
(3,14)-(3,15)
(3,14)-(3,17)
(3,16)-(3,17)
(4,3)-(4,72)
(4,9)-(4,13)
(4,52)-(4,58)
(4,52)-(4,65)
(4,59)-(4,65)
(4,63)-(4,64)
(6,22)-(6,28)
(6,22)-(6,67)
(6,29)-(6,67)
(6,36)-(6,56)
(6,40)-(6,56)
(6,41)-(6,42)
(6,49)-(6,54)
(6,50)-(6,51)
(6,52)-(6,53)
(6,60)-(6,66)
(6,61)-(6,62)
*)
