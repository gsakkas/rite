
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
(5,28)-(5,69)
(5,39)-(5,42)
(5,41)-(5,42)
(5,46)-(5,68)
(5,48)-(5,51)
(5,54)-(5,57)
(5,61)-(5,62)
*)

(* type error slice
(3,16)-(3,17)
(3,16)-(3,19)
(3,41)-(3,47)
(3,41)-(3,55)
(3,48)-(3,55)
(3,49)-(3,50)
(5,21)-(5,27)
(5,21)-(5,69)
(5,28)-(5,69)
(5,46)-(5,68)
(5,47)-(5,64)
*)

(* all spans
(2,16)-(3,63)
(3,2)-(3,63)
(3,16)-(3,19)
(3,16)-(3,17)
(3,18)-(3,19)
(3,23)-(3,63)
(3,26)-(3,35)
(3,26)-(3,28)
(3,31)-(3,35)
(3,41)-(3,55)
(3,41)-(3,47)
(3,48)-(3,55)
(3,49)-(3,50)
(3,52)-(3,54)
(3,61)-(3,63)
(5,14)-(5,69)
(5,21)-(5,69)
(5,21)-(5,27)
(5,28)-(5,69)
(5,39)-(5,42)
(5,39)-(5,40)
(5,41)-(5,42)
(5,46)-(5,68)
(5,47)-(5,64)
(5,48)-(5,51)
(5,53)-(5,63)
(5,54)-(5,57)
(5,61)-(5,62)
(5,66)-(5,67)
*)
