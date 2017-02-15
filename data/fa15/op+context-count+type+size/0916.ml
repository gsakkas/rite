
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (let g x = let calcfx = f x in (calcfx, (calcfx = x)) in ((g b), b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (let g x = let calcfx = f x in (calcfx, (calcfx = x)) in (g, b));;

*)

(* changed spans
(5,67)-(5,72)
(5,74)-(5,75)
*)

(* type error slice
(2,37)-(2,38)
(2,37)-(2,40)
(2,55)-(2,61)
(2,55)-(2,69)
(2,62)-(2,69)
(2,63)-(2,64)
(5,2)-(5,8)
(5,2)-(5,77)
(5,9)-(5,77)
(5,9)-(5,77)
(5,16)-(5,62)
(5,20)-(5,62)
(5,40)-(5,62)
(5,66)-(5,76)
(5,67)-(5,72)
(5,68)-(5,69)
*)
