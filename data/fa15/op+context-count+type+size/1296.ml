
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (let fin (f',b') = (b', ((f' b') = b')) in ((fin (f, b)), b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let fin bt = (bt, ((f bt) = bt)) in (fin, b));;

*)

(* changed spans
(5,11)-(5,69)
(5,20)-(5,47)
(5,30)-(5,32)
(5,30)-(5,47)
(5,36)-(5,38)
(5,39)-(5,41)
(5,45)-(5,47)
(5,55)-(5,64)
(5,55)-(5,69)
(5,60)-(5,64)
*)

(* type error slice
(2,38)-(2,39)
(2,38)-(2,41)
(2,56)-(2,62)
(2,56)-(2,69)
(2,64)-(2,65)
(2,64)-(2,69)
(5,3)-(5,9)
(5,3)-(5,69)
(5,11)-(5,69)
(5,11)-(5,69)
(5,20)-(5,47)
(5,30)-(5,47)
(5,55)-(5,58)
(5,55)-(5,64)
(5,55)-(5,69)
*)
