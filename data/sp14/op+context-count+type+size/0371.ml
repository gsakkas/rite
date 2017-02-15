
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((fun (f,b)  -> match f b with | b -> (b, false) | _ -> ((f b), true)),
      b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((fun a  -> if b = (f b) then (b, false) else ((f b), true)), b);;

*)

(* changed spans
(7,5)-(7,74)
(7,20)-(7,73)
(7,26)-(7,29)
*)

(* type error slice
(2,3)-(3,75)
(2,16)-(3,73)
(3,2)-(3,73)
(3,16)-(3,17)
(3,16)-(3,19)
(3,18)-(3,19)
(3,59)-(3,65)
(3,59)-(3,73)
(3,66)-(3,73)
(3,70)-(3,72)
(6,2)-(6,8)
(6,2)-(8,8)
(7,4)-(8,8)
(7,5)-(7,74)
(7,20)-(7,73)
(7,20)-(7,73)
(7,26)-(7,27)
(7,26)-(7,29)
(7,42)-(7,52)
(7,43)-(7,44)
*)
