
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
(5,42)-(5,51)
fun func ->
  (let result = f b in
   (result , result = b))
LamG VarPatG (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)

*)

(* type error slice
(3,3)-(3,74)
(3,24)-(3,25)
(3,24)-(3,27)
(3,46)-(3,52)
(3,46)-(3,63)
(3,53)-(3,63)
(3,54)-(3,55)
(5,22)-(5,28)
(5,22)-(5,66)
(5,29)-(5,66)
(5,30)-(5,62)
(5,42)-(5,51)
(5,46)-(5,49)
(5,46)-(5,51)
(5,55)-(5,61)
*)
