
let rec wwhile (f,b) =
  let (b',c') = f b in if not c' then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((), b);;



let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((fun f'  -> if (f b) = b then (b, true) else (b, false)), b);;


(* changed spans
(3,24)-(3,30)
(3,34)-(3,38)
(3,42)-(3,46)
*)

(* type error slice
(3,47)-(3,60)
(5,22)-(5,35)
*)
