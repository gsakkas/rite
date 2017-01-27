
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let ans = f b in ((ans, (ans <> b)), b));;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (let g x = let xx = f x in (xx, (xx != b)) in (g, b));;

*)

(* changed spans
(5,40)-(5,43)
(5,42)-(5,43)
(5,49)-(5,52)
(5,49)-(5,68)
(5,55)-(5,58)
(5,62)-(5,63)
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
(5,22)-(5,68)
(5,30)-(5,68)
(5,49)-(5,52)
(5,49)-(5,63)
(5,49)-(5,68)
(5,55)-(5,63)
(5,67)-(5,68)
*)
