
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) = wwhile ((fun (f,b)  -> if (f b) = b then b else f b), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((fun f'  -> if (f b) = b then (b, true) else (b, false)), b);;

*)

(* changed spans
(5,31)-(5,73)
(5,63)-(5,64)
(5,70)-(5,71)
(5,70)-(5,73)
(5,72)-(5,73)
(5,76)-(5,77)
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
(5,22)-(5,28)
(5,22)-(5,77)
(5,31)-(5,73)
(5,31)-(5,77)
(5,45)-(5,73)
(5,49)-(5,50)
(5,49)-(5,52)
(5,51)-(5,52)
(5,63)-(5,64)
(5,70)-(5,71)
(5,70)-(5,73)
(5,72)-(5,73)
(5,76)-(5,77)
*)
