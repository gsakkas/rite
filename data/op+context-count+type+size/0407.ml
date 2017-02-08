
let rec wwhile (f,b) =
  let (b',c') = f b in if not c' then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((fun f'  -> if (f b) = b then (b, true) else (b, false)), b);;

*)

(* changed spans
(3,24)-(3,60)
(3,27)-(3,30)
(3,27)-(3,33)
(5,30)-(5,32)
(5,34)-(5,35)
*)

(* type error slice
(3,17)-(3,18)
(3,17)-(3,20)
(3,47)-(3,53)
(3,47)-(3,60)
(3,55)-(3,56)
(3,55)-(3,60)
(5,22)-(5,28)
(5,22)-(5,35)
(5,30)-(5,32)
(5,30)-(5,35)
*)
