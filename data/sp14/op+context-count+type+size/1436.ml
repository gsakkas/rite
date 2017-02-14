
let rec wwhile (f,b) =
  let (x,y) = b f in if y = true then wwhile (f, x) else x;;


(* fix

let rec wwhile (f,b) =
  let (x,y) = f b in if y = true then wwhile (f, x) else x;;

*)

(* changed spans
(3,15)-(3,16)
(3,17)-(3,18)
(3,22)-(3,59)
*)

(* type error slice
(2,4)-(3,61)
(2,17)-(3,59)
(3,3)-(3,59)
(3,15)-(3,16)
(3,15)-(3,18)
(3,39)-(3,45)
(3,39)-(3,51)
(3,47)-(3,51)
(3,50)-(3,51)
*)
