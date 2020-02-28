
let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile ((let d x = let xx = f x in (xx, (xx = b)) in d b), b);;


(* fix

let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile ((let d x = let xx = f x in (xx, (xx = b)) in d), b);;

*)

(* changed spans
(7,56)-(7,59)
d
VarG

*)

(* type error slice
(3,14)-(3,15)
(3,14)-(3,17)
(4,41)-(4,47)
(4,41)-(4,58)
(4,48)-(4,58)
(4,49)-(4,50)
(7,3)-(7,9)
(7,3)-(7,64)
(7,10)-(7,64)
(7,11)-(7,60)
(7,18)-(7,52)
(7,22)-(7,52)
(7,38)-(7,52)
(7,56)-(7,57)
(7,56)-(7,59)
*)
