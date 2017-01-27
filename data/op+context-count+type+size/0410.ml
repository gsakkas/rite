
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((fun (f,b)  -> match f b with | b -> ((f b), false) | _ -> ((f b), true)),
      b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((fun a  -> if b = (f b) then (b, false) else ((f b), true)), b);;

*)

(* changed spans
(7,7)-(7,77)
(7,21)-(7,77)
(7,27)-(7,30)
(7,45)-(7,46)
(7,45)-(7,48)
*)

(* type error slice
(3,17)-(3,18)
(3,17)-(3,20)
(3,19)-(3,20)
(3,60)-(3,66)
(3,60)-(3,73)
(3,68)-(3,69)
(3,68)-(3,73)
(3,71)-(3,73)
(6,3)-(6,9)
(6,3)-(8,8)
(7,7)-(7,77)
(7,7)-(8,8)
(7,21)-(7,77)
(7,27)-(7,28)
(7,27)-(7,30)
(7,29)-(7,30)
(7,45)-(7,46)
(7,45)-(7,48)
(7,45)-(7,56)
(7,47)-(7,48)
(7,51)-(7,56)
(8,7)-(8,8)
*)
