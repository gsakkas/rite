
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) = wwhile (((f b) = b), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((fun f'  -> if (f b) = b then (b, true) else (b, false)), b);;

*)

(* changed spans
(5,29)-(5,40)
(5,42)-(5,43)
*)

(* type error slice
(3,16)-(3,17)
(3,16)-(3,19)
(3,59)-(3,65)
(3,59)-(3,73)
(3,66)-(3,73)
(3,67)-(3,68)
(5,21)-(5,27)
(5,21)-(5,44)
(5,28)-(5,44)
(5,29)-(5,40)
*)
