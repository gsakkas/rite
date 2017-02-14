
let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) = wwhile ((let g x = (f, (b = (f b))) in g), b);;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f b in (ff, (b = ff)) in (n, b));;

*)

(* changed spans
(6,31)-(6,62)
(6,31)-(6,66)
(6,42)-(6,43)
(6,42)-(6,54)
(6,46)-(6,47)
(6,46)-(6,54)
(6,61)-(6,62)
(6,65)-(6,66)
*)

(* type error slice
(3,3)-(4,72)
(3,14)-(3,15)
(3,14)-(3,17)
(4,3)-(4,72)
(4,9)-(4,13)
(4,52)-(4,58)
(4,52)-(4,64)
(4,60)-(4,61)
(4,60)-(4,64)
(4,63)-(4,64)
(6,22)-(6,28)
(6,22)-(6,66)
(6,31)-(6,62)
(6,31)-(6,62)
(6,31)-(6,66)
(6,37)-(6,54)
(6,42)-(6,43)
(6,42)-(6,54)
(6,51)-(6,52)
(6,51)-(6,54)
(6,53)-(6,54)
(6,61)-(6,62)
(6,65)-(6,66)
*)
