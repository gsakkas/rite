
let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f in (f, (x = (f x))) in (n, b));;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) = wwhile (let n x = ((f x), (x = (f x))) in (n, b));;

*)

(* changed spans
(7,20)-(7,50)
(7,29)-(7,30)
(7,35)-(7,36)
(7,38)-(7,49)
*)

(* type error slice
(2,3)-(4,73)
(2,16)-(4,71)
(3,2)-(4,71)
(3,13)-(3,14)
(3,13)-(3,16)
(3,15)-(3,16)
(4,2)-(4,71)
(4,8)-(4,12)
(4,51)-(4,57)
(4,51)-(4,64)
(4,58)-(4,64)
(4,62)-(4,63)
(7,2)-(7,8)
(7,2)-(7,61)
(7,9)-(7,61)
(7,9)-(7,61)
(7,16)-(7,50)
(7,20)-(7,50)
(7,34)-(7,50)
(7,35)-(7,36)
(7,43)-(7,48)
(7,44)-(7,45)
(7,46)-(7,47)
(7,54)-(7,60)
(7,55)-(7,56)
*)

(* all spans
(2,16)-(4,71)
(3,2)-(4,71)
(3,13)-(3,16)
(3,13)-(3,14)
(3,15)-(3,16)
(4,2)-(4,71)
(4,8)-(4,12)
(4,35)-(4,71)
(4,38)-(4,45)
(4,51)-(4,64)
(4,51)-(4,57)
(4,58)-(4,64)
(4,59)-(4,60)
(4,62)-(4,63)
(4,70)-(4,71)
(6,14)-(7,61)
(7,2)-(7,61)
(7,2)-(7,8)
(7,9)-(7,61)
(7,16)-(7,50)
(7,20)-(7,50)
(7,29)-(7,30)
(7,34)-(7,50)
(7,35)-(7,36)
(7,38)-(7,49)
(7,39)-(7,40)
(7,43)-(7,48)
(7,44)-(7,45)
(7,46)-(7,47)
(7,54)-(7,60)
(7,55)-(7,56)
(7,58)-(7,59)
*)
