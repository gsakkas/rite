
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((fun (f,b)  -> match f b with | b -> (b, false) | _ -> ((f b), true)),
      b);;



let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((fun a  -> if b = (f b) then (b, false) else ((f b), true)), b);;


(* changed spans
(7,13)-(7,14)
(7,18)-(7,42)
(7,54)-(7,60)
*)

(* type error slice
(3,60)-(3,73)
(6,3)-(8,8)
*)
