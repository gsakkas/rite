
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then wwhile (f b') else b';;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

*)

(* changed spans
(3,31)-(3,36)
(3,49)-(3,55)
*)

(* type error slice
(2,3)-(3,65)
(2,16)-(3,63)
(3,42)-(3,48)
(3,42)-(3,55)
(3,49)-(3,55)
(3,50)-(3,51)
*)
