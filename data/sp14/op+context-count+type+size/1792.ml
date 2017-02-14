
let rec wwhile (f,b) = match b with | (e,boo) -> if boo = true then e b;;


(* fix

let rec wwhile (f,b) =
  let ans = f b in
  match ans with | (num,boo) -> if boo = true then wwhile (f, num) else num;;

*)

(* changed spans
(2,23)-(2,71)
(2,29)-(2,30)
(2,49)-(2,71)
(2,68)-(2,69)
(2,70)-(2,71)
*)

(* type error slice
(2,23)-(2,71)
(2,29)-(2,30)
(2,68)-(2,69)
(2,68)-(2,71)
(2,70)-(2,71)
*)
