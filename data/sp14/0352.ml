
let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile ((let g x = let d = f x in (d, (x = d)) in g b), b);;


(* fix

let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) = wwhile ((let g x = let d = f x in (d, (x = d)) in g), b);;

*)

(* changed spans
(7,53)-(7,56)
g
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
(7,3)-(7,61)
(7,10)-(7,61)
(7,11)-(7,57)
(7,18)-(7,49)
(7,22)-(7,49)
(7,37)-(7,49)
(7,53)-(7,54)
(7,53)-(7,56)
*)
