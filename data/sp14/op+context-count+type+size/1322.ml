
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
