
let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) = wwhile (let g = f b in ((f, (g < b)), b));;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f b in (ff, (b = ff)) in (n, b));;

*)

(* changed spans
(6,28)-(6,62)
(6,37)-(6,40)
(6,45)-(6,57)
(6,46)-(6,47)
(6,49)-(6,56)
(6,50)-(6,51)
(6,54)-(6,55)
(6,59)-(6,60)
*)

(* type error slice
(3,13)-(3,14)
(3,13)-(3,16)
(4,51)-(4,57)
(4,51)-(4,64)
(4,58)-(4,64)
(4,59)-(4,60)
(6,21)-(6,27)
(6,21)-(6,62)
(6,28)-(6,62)
(6,44)-(6,61)
(6,45)-(6,57)
*)
