
let rec wwhile (f,b) =
  let (value,result) = f b in if result then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile
    ((let helper func = let (value,result) = f b in value * (not result) in
      helper), b);;


(* fix

let rec wwhile (f,b) =
  let (value,result) = f b in if result then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile
    ((let helper func = let result = f b in (result, (result = b)) in helper),
      b);;

*)

(* changed spans
(7,24)-(7,72)
(7,52)-(7,57)
(7,52)-(7,72)
(7,60)-(7,72)
(7,61)-(7,64)
(8,6)-(8,12)
*)

(* type error slice
(3,2)-(3,73)
(3,23)-(3,24)
(3,23)-(3,26)
(3,45)-(3,51)
(3,45)-(3,62)
(3,52)-(3,62)
(3,53)-(3,54)
(6,2)-(6,8)
(6,2)-(8,17)
(7,4)-(8,17)
(7,5)-(8,13)
(7,5)-(8,13)
(7,17)-(7,72)
(7,24)-(7,72)
(7,52)-(7,72)
(7,52)-(7,72)
(7,60)-(7,72)
(7,61)-(7,64)
(8,6)-(8,12)
*)
