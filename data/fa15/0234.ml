
let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f in (ff, (x = (f x))) in (n, b));;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) = wwhile (let n x = ((f x), (x = (f x))) in (n, b));;

*)

(* changed spans
(7,21)-(7,52)
(f x , x = f x)
TupleG [AppG [EmptyG],BopG EmptyG EmptyG]

*)

(* type error slice
(2,4)-(4,74)
(2,17)-(4,72)
(3,3)-(4,72)
(3,14)-(3,15)
(3,14)-(3,17)
(3,16)-(3,17)
(4,3)-(4,72)
(4,9)-(4,13)
(4,52)-(4,58)
(4,52)-(4,65)
(4,59)-(4,65)
(4,63)-(4,64)
(7,3)-(7,9)
(7,3)-(7,63)
(7,10)-(7,63)
(7,17)-(7,52)
(7,21)-(7,52)
(7,30)-(7,31)
(7,35)-(7,52)
(7,36)-(7,38)
(7,45)-(7,50)
(7,46)-(7,47)
(7,48)-(7,49)
(7,56)-(7,62)
(7,57)-(7,58)
*)
