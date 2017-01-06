
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((fun (f,b)  -> if (f b) = b then (b, false) else ((f b), true)), b);;



let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((fun a  -> if b = (f b) then (b, false) else ((f b), true)), b);;


(* changed spans
(6,16)-(6,21)
(6,35)-(6,38)
*)

(* type error slice
(3,60)-(3,73)
(6,3)-(6,77)
*)
