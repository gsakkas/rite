
let rec wwhile (f,b) =
  let (b',c') = f b in if not c' then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile (((f b) != b), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((fun f'  -> if (f b) = b then (b, true) else (b, false)), b);;

*)

(* changed spans
(3,23)-(3,60)
(3,26)-(3,29)
(3,26)-(3,32)
(5,29)-(5,41)
(5,30)-(5,35)
(5,43)-(5,44)
*)

(* type error slice
(3,16)-(3,17)
(3,16)-(3,19)
(3,46)-(3,52)
(3,46)-(3,60)
(3,53)-(3,60)
(3,54)-(3,55)
(5,21)-(5,27)
(5,21)-(5,45)
(5,28)-(5,45)
(5,29)-(5,41)
*)
