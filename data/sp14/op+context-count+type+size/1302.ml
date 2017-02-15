
let rec wwhile (f,b) =
  let (x,y) = b f in if y = true then wwhile (f, x) else x;;


(* fix

let rec wwhile (f,b) =
  let (x,y) = f b in if y = true then wwhile (f, x) else x;;

*)

(* changed spans
(3,14)-(3,15)
(3,21)-(3,58)
*)

(* type error slice
(2,3)-(3,60)
(2,16)-(3,58)
(3,2)-(3,58)
(3,14)-(3,15)
(3,14)-(3,17)
(3,38)-(3,44)
(3,38)-(3,51)
(3,45)-(3,51)
(3,49)-(3,50)
*)
