
let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f in (ff, (b = (ff b))) in (n, b));;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f b in (ff, (b = ff)) in (n, b));;

*)

(* changed spans
(7,30)-(7,31)
f b
AppG [VarG]

(7,45)-(7,51)
ff
VarG

*)

(* type error slice
(3,3)-(4,72)
(3,14)-(3,15)
(3,14)-(3,17)
(4,3)-(4,72)
(4,9)-(4,13)
(4,52)-(4,58)
(4,52)-(4,65)
(4,59)-(4,65)
(4,60)-(4,61)
(4,63)-(4,64)
(7,3)-(7,9)
(7,3)-(7,64)
(7,10)-(7,64)
(7,17)-(7,53)
(7,21)-(7,53)
(7,35)-(7,53)
(7,36)-(7,38)
(7,45)-(7,51)
(7,46)-(7,48)
(7,49)-(7,50)
(7,57)-(7,63)
(7,58)-(7,59)
(7,61)-(7,62)
*)
