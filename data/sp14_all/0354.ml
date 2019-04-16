
let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile func else value;;


(* fix

let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

*)

(* changed spans
(4,48)-(4,52)
(f , value)
TupleG (fromList [VarG])

*)

(* type error slice
(2,4)-(4,65)
(2,17)-(4,63)
(3,3)-(4,63)
(3,14)-(3,15)
(3,14)-(3,17)
(4,41)-(4,47)
(4,41)-(4,52)
(4,48)-(4,52)
*)
