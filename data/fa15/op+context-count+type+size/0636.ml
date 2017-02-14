
let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) = wwhile ((f, (b = (f b))), b);;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f b in (ff, (b = ff)) in (n, b));;

*)

(* changed spans
(6,31)-(6,32)
(6,31)-(6,43)
(6,31)-(6,49)
(6,35)-(6,36)
(6,35)-(6,43)
(6,40)-(6,43)
(6,48)-(6,49)
*)

(* type error slice
(3,14)-(3,15)
(3,14)-(3,17)
(4,52)-(4,58)
(4,52)-(4,64)
(4,60)-(4,61)
(4,60)-(4,64)
(6,22)-(6,28)
(6,22)-(6,49)
(6,31)-(6,43)
(6,31)-(6,49)
*)
