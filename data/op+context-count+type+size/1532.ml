
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
(8,6)-(10,20)
(8,17)-(9,71)
(9,8)-(9,71)
(9,15)-(9,16)
(9,15)-(9,18)
(9,15)-(9,23)
(9,17)-(9,18)
(9,22)-(9,23)
(9,41)-(9,42)
(10,8)-(10,20)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(4,42)-(4,48)
(4,42)-(4,55)
(4,50)-(4,51)
(4,50)-(4,55)
(7,3)-(7,9)
(7,3)-(10,20)
(8,6)-(10,20)
(8,6)-(10,20)
(8,15)-(9,71)
(8,17)-(9,71)
(9,8)-(9,71)
(9,41)-(9,48)
(10,8)-(10,12)
(10,8)-(10,16)
(10,8)-(10,20)
*)
