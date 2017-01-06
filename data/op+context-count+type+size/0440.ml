
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) = wwhile (((f b), ((f b) = b)), b);;



let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((fun f'  -> if (f b) = b then (b, true) else (b, false)), b);;


(* changed spans
(5,36)-(5,39)
(5,40)-(5,41)
(5,45)-(5,46)
*)

(* type error slice
(3,60)-(3,73)
(5,22)-(5,53)
*)
