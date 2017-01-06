
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((fun (f,b)  -> if (f b) = b then ((f b), false) else ((f b), true)), b);;



let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((fun a  -> if b = (f b) then (b, false) else ((f b), true)), b);;


(* changed spans
(7,11)-(7,16)
(7,30)-(7,33)
(7,40)-(7,42)
(7,44)-(7,45)
*)

(* type error slice
(3,60)-(3,73)
(6,3)-(7,76)
*)
