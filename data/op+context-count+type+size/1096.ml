
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
(5,31)-(5,34)
(5,31)-(5,39)
(5,31)-(5,44)
(5,36)-(5,39)
(5,38)-(5,39)
(5,43)-(5,44)
*)

(* type error slice
(3,17)-(3,18)
(3,17)-(3,20)
(3,19)-(3,20)
(3,42)-(3,48)
(3,42)-(3,55)
(3,50)-(3,51)
(3,50)-(3,55)
(3,53)-(3,55)
(5,22)-(5,28)
(5,22)-(5,44)
(5,31)-(5,34)
(5,31)-(5,39)
(5,31)-(5,44)
(5,43)-(5,44)
*)
