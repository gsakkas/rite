
let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) =
  wwhile
    (let func x y =
       match (x y) = y with | true  -> (x, true) | false  -> (x, false) in
     ((func f b), b));;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(8,4)-(10,21)
(8,16)-(9,71)
(9,7)-(9,71)
(9,13)-(9,18)
(9,13)-(9,22)
(9,14)-(9,15)
(9,16)-(9,17)
(9,21)-(9,22)
(9,40)-(9,41)
(9,65)-(9,70)
(10,5)-(10,20)
*)

(* type error slice
(3,8)-(3,9)
(3,8)-(3,11)
(4,41)-(4,47)
(4,41)-(4,55)
(4,48)-(4,55)
(4,49)-(4,50)
(7,2)-(7,8)
(7,2)-(10,21)
(8,4)-(10,21)
(8,4)-(10,21)
(8,14)-(9,71)
(8,16)-(9,71)
(9,7)-(9,71)
(9,39)-(9,48)
(10,5)-(10,20)
(10,6)-(10,16)
(10,7)-(10,11)
*)
