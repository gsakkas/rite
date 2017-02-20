
let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile f a;;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

*)

(* changed spans
(3,49)-(3,59)
(3,56)-(3,57)
*)

(* type error slice
(2,3)-(3,61)
(2,16)-(3,59)
(3,49)-(3,55)
(3,49)-(3,59)
(3,56)-(3,57)
*)

(* all spans
(2,16)-(3,59)
(3,2)-(3,59)
(3,8)-(3,11)
(3,8)-(3,9)
(3,10)-(3,11)
(3,28)-(3,59)
(3,31)-(3,36)
(3,31)-(3,34)
(3,35)-(3,36)
(3,42)-(3,43)
(3,49)-(3,59)
(3,49)-(3,55)
(3,56)-(3,57)
(3,58)-(3,59)
*)
