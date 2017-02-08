
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) = wwhile (((f b), ((f b) = b)), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((fun f'  -> if (f b) = b then (b, true) else (b, false)), b);;

*)

(* changed spans
(5,32)-(5,33)
(5,32)-(5,35)
(5,32)-(5,48)
(5,34)-(5,35)
(5,40)-(5,48)
(5,52)-(5,53)
*)

(* type error slice
(3,17)-(3,18)
(3,17)-(3,20)
(3,60)-(3,66)
(3,60)-(3,73)
(3,68)-(3,69)
(3,68)-(3,73)
(5,22)-(5,28)
(5,22)-(5,53)
(5,32)-(5,48)
(5,32)-(5,53)
*)
