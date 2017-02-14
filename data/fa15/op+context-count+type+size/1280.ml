
let rec wwhile (f,b) =
  let (x,y) = f b in if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  wwhile ((if (f b) = b then (b, false) else ((f b), true)), b);;


(* fix

let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) =
  wwhile (let g b = ((f b), (if (f b) = b then false else true)) in (g, b));;

*)

(* changed spans
(3,3)-(3,59)
(3,25)-(3,34)
(3,29)-(3,34)
(3,40)-(3,41)
(5,15)-(6,63)
(6,12)-(6,58)
(6,12)-(6,63)
(6,31)-(6,32)
(6,31)-(6,39)
(6,48)-(6,49)
(6,48)-(6,51)
(6,48)-(6,58)
(6,50)-(6,51)
(6,62)-(6,63)
*)

(* type error slice
(3,15)-(3,16)
(3,15)-(3,18)
(3,47)-(3,53)
(3,47)-(3,59)
(3,55)-(3,56)
(3,55)-(3,59)
(6,3)-(6,9)
(6,3)-(6,63)
(6,12)-(6,58)
(6,12)-(6,63)
(6,31)-(6,39)
*)
