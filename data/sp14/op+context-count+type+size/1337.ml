
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
(7,55)-(7,58)
(7,61)-(7,62)
*)

(* type error slice
(3,13)-(3,14)
(3,13)-(3,16)
(4,40)-(4,46)
(4,40)-(4,57)
(4,47)-(4,57)
(4,48)-(4,49)
(7,2)-(7,8)
(7,2)-(7,63)
(7,9)-(7,63)
(7,10)-(7,59)
(7,10)-(7,59)
(7,17)-(7,51)
(7,21)-(7,51)
(7,37)-(7,51)
(7,55)-(7,56)
(7,55)-(7,58)
*)
