
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (let fin bt = (bt, ((f bt) = bt)) in ((fin b), b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let fin bt = (bt, ((f bt) = bt)) in (fin, b));;

*)

(* changed spans
(5,11)-(5,58)
(5,49)-(5,54)
(5,57)-(5,58)
*)

(* type error slice
(2,38)-(2,39)
(2,38)-(2,41)
(2,56)-(2,62)
(2,56)-(2,69)
(2,64)-(2,65)
(2,64)-(2,69)
(5,3)-(5,9)
(5,3)-(5,58)
(5,11)-(5,58)
(5,11)-(5,58)
(5,19)-(5,41)
(5,25)-(5,41)
(5,49)-(5,52)
(5,49)-(5,54)
(5,49)-(5,58)
*)
