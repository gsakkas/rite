
let fixpointHelper f =
  match f with | (num,expr) -> if expr then (num, true) else (num, false);;

let rec wwhile (f,b) =
  match f b with | (num,expr) -> if expr then wwhile (f, num) else num;;

let fixpoint (f,b) = wwhile ((fixpointHelper f), b);;


(* fix

let fixpointHelper f b b = ((f b), (if (f b) = b then true else false));;

let rec wwhile (f,b) =
  match f b with | (num,expr) -> if expr then wwhile (f, num) else num;;

let fixpoint (f,b) = wwhile ((fixpointHelper f b), b);;

*)

(* changed spans
(3,3)-(3,74)
fun b ->
  fun b ->
    (f b , if f b = b
           then true
           else false)
LamG VarPatG (LamG VarPatG EmptyG)

(8,30)-(8,48)
fixpointHelper f b
AppG (fromList [VarG])

*)

(* type error slice
(2,4)-(3,76)
(2,20)-(3,74)
(3,3)-(3,74)
(3,32)-(3,74)
(3,62)-(3,74)
(6,9)-(6,10)
(6,9)-(6,12)
(6,47)-(6,53)
(6,47)-(6,62)
(6,54)-(6,62)
(6,55)-(6,56)
(8,22)-(8,28)
(8,22)-(8,52)
(8,29)-(8,52)
(8,30)-(8,48)
(8,31)-(8,45)
*)
