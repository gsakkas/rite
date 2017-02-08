
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
(7,62)-(7,63)
*)

(* type error slice
(3,14)-(3,15)
(3,14)-(3,17)
(4,41)-(4,47)
(4,41)-(4,57)
(4,49)-(4,50)
(4,49)-(4,57)
(7,3)-(7,9)
(7,3)-(7,63)
(7,12)-(7,59)
(7,12)-(7,59)
(7,12)-(7,63)
(7,18)-(7,50)
(7,22)-(7,50)
(7,39)-(7,50)
(7,56)-(7,57)
(7,56)-(7,59)
*)
