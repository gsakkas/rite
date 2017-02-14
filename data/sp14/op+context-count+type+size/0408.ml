
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) = wwhile ((f (f b)), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((fun f'  -> if (f b) = b then (b, true) else (b, false)), b);;

*)

(* changed spans
(5,31)-(5,32)
(5,31)-(5,37)
(5,34)-(5,37)
*)

(* type error slice
(3,3)-(3,73)
(3,17)-(3,18)
(3,17)-(3,20)
(3,60)-(3,66)
(3,60)-(3,73)
(3,68)-(3,69)
(3,68)-(3,73)
(3,71)-(3,73)
(5,22)-(5,28)
(5,22)-(5,42)
(5,31)-(5,32)
(5,31)-(5,37)
(5,31)-(5,42)
(5,34)-(5,35)
(5,34)-(5,37)
(5,36)-(5,37)
(5,41)-(5,42)
*)
