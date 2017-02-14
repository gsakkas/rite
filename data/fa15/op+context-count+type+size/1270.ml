
let rec wwhile (f,b) =
  let (value,result) = f b in if result then wwhile (f, value) else value;;

let fixpoint (f,b) = wwhile ((let helper func = func in helper), b);;


(* fix

let rec wwhile (f,b) =
  let (value,result) = f b in if result then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile
    ((let helper func = let result = f b in (result, (result = b)) in helper),
      b);;

*)

(* changed spans
(5,31)-(5,63)
(5,49)-(5,53)
(5,57)-(5,63)
*)

(* type error slice
(2,4)-(3,76)
(2,17)-(3,74)
(3,3)-(3,74)
(3,24)-(3,25)
(3,24)-(3,27)
(3,26)-(3,27)
(3,46)-(3,52)
(3,46)-(3,62)
(3,54)-(3,62)
(3,57)-(3,62)
(5,22)-(5,28)
(5,22)-(5,67)
(5,31)-(5,63)
(5,31)-(5,63)
(5,31)-(5,67)
(5,42)-(5,53)
(5,49)-(5,53)
(5,57)-(5,63)
*)
