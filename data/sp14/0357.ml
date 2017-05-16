
let rec wwhile (f,b) =
  let func = f b in let (value,boo) = func in if boo then wwhile f else value;;


(* fix

let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

*)

(* changed spans
(3,65)-(3,66)
*)

(* type error slice
(2,3)-(3,79)
(2,16)-(3,77)
(3,58)-(3,64)
(3,58)-(3,66)
(3,65)-(3,66)
*)

(* all spans
(2,16)-(3,77)
(3,2)-(3,77)
(3,13)-(3,16)
(3,13)-(3,14)
(3,15)-(3,16)
(3,20)-(3,77)
(3,38)-(3,42)
(3,46)-(3,77)
(3,49)-(3,52)
(3,58)-(3,66)
(3,58)-(3,64)
(3,65)-(3,66)
(3,72)-(3,77)
*)
