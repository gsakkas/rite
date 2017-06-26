
let rec wwhile (f,b) =
  let x = f b in match x with | h::t -> if t then wwhile (f, h) else h;;


(* fix

let rec wwhile (f,b) =
  let x = f b in
  match x with | (x,y) -> if y = false then x else wwhile (f, x);;

*)

(* changed spans
(3,17)-(3,70)
(3,43)-(3,44)
(3,50)-(3,63)
(3,61)-(3,62)
(3,69)-(3,70)
*)

(* type error slice
(3,17)-(3,70)
(3,40)-(3,70)
(3,43)-(3,44)
*)

(* all spans
(2,16)-(3,70)
(3,2)-(3,70)
(3,10)-(3,13)
(3,10)-(3,11)
(3,12)-(3,13)
(3,17)-(3,70)
(3,23)-(3,24)
(3,40)-(3,70)
(3,43)-(3,44)
(3,50)-(3,63)
(3,50)-(3,56)
(3,57)-(3,63)
(3,58)-(3,59)
(3,61)-(3,62)
(3,69)-(3,70)
*)
