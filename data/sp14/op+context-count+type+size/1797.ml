
let rec wwhile (f,b) =
  match b with | (e,boo) -> if boo = true then e else wwhile e b;;


(* fix

let rec wwhile (f,b) =
  let ans = f b in
  match ans with | (num,boo) -> if boo = true then wwhile (f, num) else num;;

*)

(* changed spans
(3,2)-(3,64)
(3,8)-(3,9)
(3,28)-(3,64)
(3,47)-(3,48)
(3,54)-(3,64)
(3,61)-(3,62)
(3,63)-(3,64)
*)

(* type error slice
(2,3)-(3,66)
(2,16)-(3,64)
(3,2)-(3,64)
(3,8)-(3,9)
(3,54)-(3,60)
(3,54)-(3,64)
(3,61)-(3,62)
*)
