
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (let g x = let calcfx = f x in (calcfx, (calcfx = x)) in ((g b), b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (let g x = let calcfx = f x in (calcfx, (calcfx = x)) in (g, b));;

*)

(* changed spans
(5,69)-(5,72)
(5,75)-(5,76)
*)

(* type error slice
(2,38)-(2,39)
(2,38)-(2,41)
(2,56)-(2,62)
(2,56)-(2,69)
(2,64)-(2,65)
(2,64)-(2,69)
(5,3)-(5,9)
(5,3)-(5,76)
(5,11)-(5,76)
(5,11)-(5,76)
(5,17)-(5,61)
(5,21)-(5,61)
(5,42)-(5,61)
(5,69)-(5,70)
(5,69)-(5,72)
(5,69)-(5,76)
*)
