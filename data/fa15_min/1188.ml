
let rec wwhile (f,b) =
  match b with | b -> if (f b) = ((f b), true) then wwhile (f, b);;


(* fix

let rec wwhile (f,b) =
  match b with | b -> if (f b) = (b, true) then wwhile (f, b);;

*)

(* changed spans
(3,35)-(3,40)
b
VarG

*)

(* type error slice
(3,26)-(3,31)
(3,26)-(3,47)
(3,27)-(3,28)
(3,34)-(3,47)
(3,35)-(3,40)
(3,36)-(3,37)
*)
