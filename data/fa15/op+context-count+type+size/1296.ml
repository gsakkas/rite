
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (let fin (f',b') = (b', ((f' b') = b')) in ((fin (f, b)), b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let fin bt = (bt, ((f bt) = bt)) in (fin, b));;

*)

(* changed spans
(5,9)-(5,70)
(5,19)-(5,48)
(5,28)-(5,48)
(5,29)-(5,31)
(5,35)-(5,37)
(5,38)-(5,40)
(5,44)-(5,46)
(5,52)-(5,69)
(5,53)-(5,65)
(5,58)-(5,64)
*)

(* type error slice
(2,37)-(2,38)
(2,37)-(2,40)
(2,55)-(2,61)
(2,55)-(2,69)
(2,62)-(2,69)
(2,63)-(2,64)
(5,2)-(5,8)
(5,2)-(5,70)
(5,9)-(5,70)
(5,9)-(5,70)
(5,19)-(5,48)
(5,28)-(5,48)
(5,52)-(5,69)
(5,53)-(5,65)
(5,54)-(5,57)
*)
