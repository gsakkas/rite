
let rec wwhile (f,b) =
  let x = f b in match x with | h::t -> if t then wwhile (f, h) else h;;


(* fix

let rec wwhile (f,b) =
  let x = f b in
  match x with | (x,y) -> if y = false then x else wwhile (f, x);;

*)

(* changed spans
(3,18)-(3,71)
(3,44)-(3,45)
(3,51)-(3,63)
(3,62)-(3,63)
(3,70)-(3,71)
*)

(* type error slice
(3,18)-(3,71)
(3,18)-(3,71)
(3,41)-(3,71)
(3,44)-(3,45)
*)
