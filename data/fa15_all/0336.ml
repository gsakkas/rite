
let fixpointHelper (f,b) = if (f b) = b then (b, true) else (b, false);;

let rec wwhile (f,b) =
  match f b with | (num,expr) -> if expr then wwhile (f, num) else num;;

let fixpoint (f,b) = wwhile ((fixpointHelper (f, b)), b);;


(* fix

let fixpointHelper f b b = ((f b), (if (f b) = b then true else false));;

let rec wwhile (f,b) =
  match f b with | (num,expr) -> if expr then wwhile (f, num) else num;;

let fixpoint (f,b) = wwhile ((fixpointHelper f b), b);;

*)

(* changed spans
(2,21)-(2,71)
fun f ->
  fun b ->
    fun b ->
      (f b , if f b = b
             then true
             else false)
LamG VarPatG (LamG EmptyPatG EmptyG)

(7,30)-(7,53)
fixpointHelper f b
AppG [VarG,VarG]

*)

(* type error slice
(2,4)-(2,73)
(2,21)-(2,71)
(2,28)-(2,71)
(2,61)-(2,71)
(5,9)-(5,10)
(5,9)-(5,12)
(5,47)-(5,53)
(5,47)-(5,62)
(5,54)-(5,62)
(5,55)-(5,56)
(7,22)-(7,28)
(7,22)-(7,57)
(7,29)-(7,57)
(7,30)-(7,53)
(7,31)-(7,45)
*)
