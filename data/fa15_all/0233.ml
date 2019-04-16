
let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f b in (f, (b = ff)) in (n, b));;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f b in (ff, (b = (f b))) in (n, b));;

*)

(* changed spans
(7,38)-(7,39)
ff
VarG

(7,46)-(7,48)
f b
AppG (fromList [VarG])

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
(7,3)-(7,61)
(7,10)-(7,61)
(7,17)-(7,50)
(7,21)-(7,50)
(7,30)-(7,31)
(7,30)-(7,33)
(7,32)-(7,33)
(7,37)-(7,50)
(7,38)-(7,39)
(7,54)-(7,60)
(7,55)-(7,56)
(7,58)-(7,59)
*)
