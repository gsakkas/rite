
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | true  -> wwhile (f, b') | false  -> b';;

let fixpoint (f,b) = wwhile ((let func (x,y) = (f x) = y in func), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | true  -> wwhile (f, b') | false  -> b';;

let fixpoint (f,b) = wwhile ((fun b'  -> let x = f b' in (x, (b' != x))), b);;

*)

(* changed spans
(5,31)-(5,65)
(5,41)-(5,57)
(5,49)-(5,52)
(5,49)-(5,57)
(5,51)-(5,52)
(5,56)-(5,57)
(5,61)-(5,65)
(5,68)-(5,69)
*)

(* type error slice
(3,3)-(3,78)
(3,17)-(3,18)
(3,17)-(3,20)
(3,49)-(3,55)
(3,49)-(3,62)
(3,57)-(3,58)
(3,57)-(3,62)
(5,22)-(5,28)
(5,22)-(5,69)
(5,31)-(5,65)
(5,31)-(5,65)
(5,31)-(5,69)
(5,41)-(5,57)
(5,49)-(5,57)
(5,61)-(5,65)
*)
