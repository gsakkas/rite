
let rec wwhile (f,b) =
  match b with
  | (express,boo) -> if boo = true then wwhile (f, express) else express;;


(* fix

let rec wwhile (f,b) =
  let ans = f b in
  match ans with | (num,boo) -> if boo = true then wwhile (f, num) else num;;

*)

(* changed spans
(3,2)-(4,72)
(3,8)-(3,9)
(4,21)-(4,72)
(4,51)-(4,58)
(4,65)-(4,72)
*)

(* type error slice
(2,3)-(4,74)
(2,16)-(4,72)
(3,2)-(4,72)
(3,8)-(3,9)
(4,40)-(4,46)
(4,40)-(4,59)
(4,47)-(4,59)
(4,51)-(4,58)
*)

(* all spans
(2,16)-(4,72)
(3,2)-(4,72)
(3,8)-(3,9)
(4,21)-(4,72)
(4,24)-(4,34)
(4,24)-(4,27)
(4,30)-(4,34)
(4,40)-(4,59)
(4,40)-(4,46)
(4,47)-(4,59)
(4,48)-(4,49)
(4,51)-(4,58)
(4,65)-(4,72)
*)
