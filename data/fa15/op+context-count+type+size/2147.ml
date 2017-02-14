
let rec wwhile (f,b) =
  let x = f b in match x with | h::t -> if t = true then wwhile (f, h) else h;;


(* fix

let rec wwhile (f,b) =
  let x = f b in
  match x with | (x,y) -> if y = false then x else wwhile (f, x);;

*)

(* changed spans
(3,17)-(3,77)
(3,43)-(3,44)
(3,47)-(3,51)
(3,57)-(3,70)
(3,68)-(3,69)
(3,76)-(3,77)
*)

(* type error slice
(3,17)-(3,77)
(3,17)-(3,77)
(3,43)-(3,44)
(3,43)-(3,51)
(3,43)-(3,51)
(3,47)-(3,51)
*)
