
let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile ((let n z = let xx = f in (xx, (b = (f b))) in n), b);;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f b in (ff, (b = ff)) in (n, b));;

*)

(* changed spans
(7,9)-(7,62)
(7,10)-(7,58)
(7,17)-(7,52)
(7,21)-(7,52)
(7,30)-(7,31)
(7,35)-(7,52)
(7,36)-(7,38)
(7,45)-(7,50)
(7,46)-(7,47)
(7,48)-(7,49)
(7,56)-(7,57)
*)

(* type error slice
(3,2)-(4,71)
(3,13)-(3,14)
(3,13)-(3,16)
(4,2)-(4,71)
(4,8)-(4,12)
(4,51)-(4,57)
(4,51)-(4,64)
(4,58)-(4,64)
(4,59)-(4,60)
(4,62)-(4,63)
(7,2)-(7,8)
(7,2)-(7,62)
(7,9)-(7,62)
(7,10)-(7,58)
(7,10)-(7,58)
(7,17)-(7,52)
(7,21)-(7,52)
(7,21)-(7,52)
(7,30)-(7,31)
(7,35)-(7,52)
(7,36)-(7,38)
(7,45)-(7,50)
(7,46)-(7,47)
(7,48)-(7,49)
(7,56)-(7,57)
(7,60)-(7,61)
*)
