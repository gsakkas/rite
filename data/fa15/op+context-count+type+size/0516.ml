
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile f b' else b';;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

*)

(* changed spans
(3,2)-(3,60)
(3,26)-(3,35)
(3,31)-(3,35)
(3,41)-(3,52)
(3,48)-(3,49)
*)

(* type error slice
(2,3)-(3,62)
(2,16)-(3,60)
(3,41)-(3,47)
(3,41)-(3,52)
(3,48)-(3,49)
*)
