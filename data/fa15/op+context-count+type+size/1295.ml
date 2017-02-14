
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (let fin b' = (b', ((f b') = b')) in ((fin b), b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let fin bt = (bt, ((f bt) = bt)) in (fin, b));;

*)

(* changed spans
(5,9)-(5,59)
(5,18)-(5,42)
(5,23)-(5,42)
(5,24)-(5,26)
(5,32)-(5,34)
(5,38)-(5,40)
(5,46)-(5,58)
(5,47)-(5,54)
(5,56)-(5,57)
*)

(* type error slice
(2,37)-(2,38)
(2,37)-(2,40)
(2,55)-(2,61)
(2,55)-(2,69)
(2,62)-(2,69)
(2,63)-(2,64)
(5,2)-(5,8)
(5,2)-(5,59)
(5,9)-(5,59)
(5,9)-(5,59)
(5,18)-(5,42)
(5,23)-(5,42)
(5,46)-(5,58)
(5,47)-(5,54)
(5,48)-(5,51)
*)
