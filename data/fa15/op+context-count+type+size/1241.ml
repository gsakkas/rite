
let fixpointHelper f b =
  let c = f b in if c = b then (c, true) else (c, false);;

let rec wwhile (f,b) =
  match f b with | (num,expr) -> if expr then wwhile (f, num) else num;;

let fixpoint (f,b) = wwhile ((fixpointHelper f b), b);;


(* fix

let fixpointHelper f b b = ((f b), (if (f b) = b then true else false));;

let rec wwhile (f,b) =
  match f b with | (num,expr) -> if expr then wwhile (f, num) else num;;

let fixpoint (f,b) = wwhile ((fixpointHelper f b), b);;

*)

(* changed spans
(3,3)-(3,56)
(3,11)-(3,14)
(3,21)-(3,22)
(3,25)-(3,26)
(3,33)-(3,34)
(3,33)-(3,40)
(3,48)-(3,49)
(3,48)-(3,56)
*)

(* type error slice
(2,4)-(3,59)
(2,20)-(3,56)
(2,22)-(3,56)
(3,3)-(3,56)
(3,18)-(3,56)
(3,33)-(3,40)
(6,9)-(6,10)
(6,9)-(6,12)
(6,47)-(6,53)
(6,47)-(6,61)
(6,55)-(6,56)
(6,55)-(6,61)
(8,22)-(8,28)
(8,22)-(8,53)
(8,31)-(8,45)
(8,31)-(8,49)
(8,31)-(8,53)
*)
