
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
(6,28)-(6,49)
(6,29)-(6,45)
(6,30)-(6,31)
(6,33)-(6,44)
(6,34)-(6,35)
(6,38)-(6,43)
(6,47)-(6,48)
*)

(* type error slice
(3,13)-(3,14)
(3,13)-(3,16)
(4,51)-(4,57)
(4,51)-(4,64)
(4,58)-(4,64)
(4,59)-(4,60)
(6,21)-(6,27)
(6,21)-(6,49)
(6,28)-(6,49)
(6,29)-(6,45)
*)
