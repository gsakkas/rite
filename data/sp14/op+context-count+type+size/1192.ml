
let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (func, boo) else value;;


(* fix

let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

*)

(* changed spans
(4,48)-(4,52)
(4,54)-(4,57)
*)

(* type error slice
(2,3)-(4,71)
(2,16)-(4,69)
(3,13)-(3,14)
(3,13)-(3,16)
(4,2)-(4,69)
(4,20)-(4,24)
(4,40)-(4,46)
(4,40)-(4,58)
(4,47)-(4,58)
(4,48)-(4,52)
*)

(* all spans
(2,16)-(4,69)
(3,2)-(4,69)
(3,13)-(3,16)
(3,13)-(3,14)
(3,15)-(3,16)
(4,2)-(4,69)
(4,20)-(4,24)
(4,28)-(4,69)
(4,31)-(4,34)
(4,40)-(4,58)
(4,40)-(4,46)
(4,47)-(4,58)
(4,48)-(4,52)
(4,54)-(4,57)
(4,64)-(4,69)
*)
