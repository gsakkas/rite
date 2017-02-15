
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
