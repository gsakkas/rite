
let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile func else value;;


(* fix

let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

*)

(* changed spans
(4,47)-(4,51)
(4,57)-(4,62)
*)

(* type error slice
(2,3)-(4,64)
(2,16)-(4,62)
(3,2)-(4,62)
(3,13)-(3,14)
(3,13)-(3,16)
(4,40)-(4,46)
(4,40)-(4,51)
(4,47)-(4,51)
*)

(* all spans
(2,16)-(4,62)
(3,2)-(4,62)
(3,13)-(3,16)
(3,13)-(3,14)
(3,15)-(3,16)
(4,2)-(4,62)
(4,20)-(4,24)
(4,28)-(4,62)
(4,31)-(4,34)
(4,40)-(4,51)
(4,40)-(4,46)
(4,47)-(4,51)
(4,57)-(4,62)
*)
