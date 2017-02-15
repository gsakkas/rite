
let rec wwhile (f,b) =
  let func = f b in let (value,boo) = func in if boo then wwhile f else value;;


(* fix

let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

*)

(* changed spans
(3,20)-(3,77)
(3,65)-(3,66)
*)

(* type error slice
(2,3)-(3,79)
(2,16)-(3,77)
(3,58)-(3,64)
(3,58)-(3,66)
(3,65)-(3,66)
*)
