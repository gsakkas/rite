
let rec wwhile (f,b) =
  let x = f b in
  match x with | h::t -> if t = false then h else wwhile (f, h);;


(* fix

let rec wwhile (f,b) =
  let x = f b in
  match x with | (x,y) -> if y = false then x else wwhile (f, x);;

*)

(* changed spans
(4,2)-(4,63)
(4,28)-(4,29)
(4,43)-(4,44)
(4,61)-(4,62)
*)

(* type error slice
(4,2)-(4,63)
(4,2)-(4,63)
(4,28)-(4,29)
(4,28)-(4,37)
(4,28)-(4,37)
(4,32)-(4,37)
*)
