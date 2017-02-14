
let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let g x = let xx = f in (xx, (b = (f b))) in (g, b));;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f b in (ff, (b = ff)) in (n, b));;

*)

(* changed spans
(7,9)-(7,62)
(7,20)-(7,51)
(7,29)-(7,30)
(7,34)-(7,51)
(7,35)-(7,37)
(7,44)-(7,49)
(7,45)-(7,46)
(7,47)-(7,48)
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
(7,9)-(7,62)
(7,16)-(7,51)
(7,20)-(7,51)
(7,20)-(7,51)
(7,29)-(7,30)
(7,34)-(7,51)
(7,35)-(7,37)
(7,44)-(7,49)
(7,45)-(7,46)
(7,47)-(7,48)
(7,55)-(7,61)
(7,56)-(7,57)
(7,59)-(7,60)
*)
