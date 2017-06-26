
let rec wwhile (f,b) =
  let (value,result) = f b in if result then wwhile (f, value) else value;;

let fixpoint (f,b) = wwhile ((let helper f = not f in helper), b);;


(* fix

let rec wwhile (f,b) =
  let (value,result) = f b in if result then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile
    ((let helper func = let result = f b in (result, (result = b)) in helper),
      b);;

*)

(* changed spans
(5,41)-(5,50)
(5,45)-(5,48)
(5,45)-(5,50)
(5,54)-(5,60)
*)

(* type error slice
(3,2)-(3,73)
(3,23)-(3,24)
(3,23)-(3,26)
(3,45)-(3,51)
(3,45)-(3,62)
(3,52)-(3,62)
(3,53)-(3,54)
(5,21)-(5,27)
(5,21)-(5,65)
(5,28)-(5,65)
(5,29)-(5,61)
(5,41)-(5,50)
(5,45)-(5,48)
(5,45)-(5,50)
(5,54)-(5,60)
*)

(* all spans
(2,16)-(3,73)
(3,2)-(3,73)
(3,23)-(3,26)
(3,23)-(3,24)
(3,25)-(3,26)
(3,30)-(3,73)
(3,33)-(3,39)
(3,45)-(3,62)
(3,45)-(3,51)
(3,52)-(3,62)
(3,53)-(3,54)
(3,56)-(3,61)
(3,68)-(3,73)
(5,14)-(5,65)
(5,21)-(5,65)
(5,21)-(5,27)
(5,28)-(5,65)
(5,29)-(5,61)
(5,41)-(5,50)
(5,45)-(5,50)
(5,45)-(5,48)
(5,49)-(5,50)
(5,54)-(5,60)
(5,63)-(5,64)
*)
