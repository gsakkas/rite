
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f b') else c';;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else c';;

*)

(* changed spans
(3,50)-(3,54)
*)

(* type error slice
(2,4)-(3,65)
(2,17)-(3,63)
(3,42)-(3,48)
(3,42)-(3,54)
(3,50)-(3,51)
(3,50)-(3,54)
*)
