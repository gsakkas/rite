
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

(* all spans
(2,16)-(3,63)
(3,2)-(3,63)
(3,16)-(3,19)
(3,16)-(3,17)
(3,18)-(3,19)
(3,23)-(3,63)
(3,26)-(3,36)
(3,26)-(3,28)
(3,31)-(3,36)
(3,42)-(3,55)
(3,42)-(3,48)
(3,49)-(3,55)
(3,50)-(3,51)
(3,52)-(3,54)
(3,61)-(3,63)
*)
