
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((not (f b)), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (let g x = let xx = f x in (xx, (xx != b)) in (g, b));;

*)

(* changed spans
(5,28)-(5,44)
(5,29)-(5,40)
(5,30)-(5,33)
(5,34)-(5,39)
(5,37)-(5,38)
(5,42)-(5,43)
*)

(* type error slice
(3,16)-(3,17)
(3,16)-(3,19)
(3,41)-(3,47)
(3,41)-(3,55)
(3,48)-(3,55)
(3,49)-(3,50)
(5,21)-(5,27)
(5,21)-(5,44)
(5,28)-(5,44)
(5,29)-(5,40)
(5,30)-(5,33)
*)
