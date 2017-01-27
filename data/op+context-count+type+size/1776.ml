
let rec wwhile (f,b) =
  match b with | (e,boo) -> if boo = true then e else wwhile b;;


(* fix

let rec wwhile (f,b) =
  let ans = f b in
  match ans with | (num,boo) -> if boo = true then wwhile (f, num) else num;;

*)

(* changed spans
(3,3)-(3,63)
(3,9)-(3,10)
(3,29)-(3,63)
(3,48)-(3,49)
(3,55)-(3,61)
(3,62)-(3,63)
*)

(* type error slice
(2,4)-(3,65)
(2,17)-(3,63)
(3,3)-(3,63)
(3,9)-(3,10)
(3,29)-(3,63)
(3,32)-(3,35)
(3,32)-(3,42)
(3,38)-(3,42)
(3,48)-(3,49)
(3,55)-(3,61)
(3,55)-(3,63)
(3,62)-(3,63)
*)
