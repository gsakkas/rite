
let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) =
  wwhile
    (let g y x =
       let sec s fi m = if s = fi then (s, (s = (m s))) else (s, false) in
       sec (y x) x in
     ((g f b), b));;


(* fix

let h x = ((x * x), (x < 100));;

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(7,5)-(10,19)
(h , b)
TupleG [VarG,VarG]

*)

(* type error slice
(2,4)-(3,65)
(2,17)-(3,63)
(3,9)-(3,10)
(3,9)-(3,12)
(3,11)-(3,12)
(6,3)-(6,9)
(6,3)-(10,19)
(7,5)-(10,19)
(7,12)-(9,19)
(7,14)-(9,19)
(8,8)-(9,19)
(8,16)-(8,72)
(8,18)-(8,72)
(8,21)-(8,72)
(8,28)-(8,29)
(8,28)-(8,34)
(8,32)-(8,34)
(8,49)-(8,54)
(8,50)-(8,51)
(8,52)-(8,53)
(9,8)-(9,11)
(9,8)-(9,19)
(9,18)-(9,19)
(10,6)-(10,18)
(10,7)-(10,14)
(10,8)-(10,9)
(10,12)-(10,13)
(10,16)-(10,17)
*)
