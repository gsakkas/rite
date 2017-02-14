
let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) = wwhile (let g = (f, (b = (f b))) in (g, b));;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f b in (ff, (b = ff)) in (n, b));;

*)

(* changed spans
(6,28)-(6,64)
(6,37)-(6,53)
(6,38)-(6,39)
(6,41)-(6,52)
(6,42)-(6,43)
(6,46)-(6,51)
(6,58)-(6,59)
(6,61)-(6,62)
*)

(* type error slice
(3,13)-(3,14)
(3,13)-(3,16)
(4,51)-(4,57)
(4,51)-(4,64)
(4,58)-(4,64)
(4,59)-(4,60)
(6,21)-(6,27)
(6,21)-(6,64)
(6,28)-(6,64)
(6,28)-(6,64)
(6,37)-(6,53)
(6,57)-(6,63)
(6,58)-(6,59)
*)
