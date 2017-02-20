
let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) =
  wwhile
    (let func x y =
       match (x y) = y with
       | true  -> ((x, true), b)
       | false  -> ((x, false), b) in
     func f b);;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(8,4)-(12,14)
(8,16)-(11,34)
(9,7)-(11,34)
(9,13)-(9,18)
(9,13)-(9,22)
(9,14)-(9,15)
(9,16)-(9,17)
(9,21)-(9,22)
(10,18)-(10,32)
(10,20)-(10,21)
(10,30)-(10,31)
(11,21)-(11,22)
(12,5)-(12,13)
*)

(* type error slice
(3,8)-(3,9)
(3,8)-(3,11)
(4,41)-(4,47)
(4,41)-(4,55)
(4,48)-(4,55)
(4,49)-(4,50)
(7,2)-(7,8)
(7,2)-(12,14)
(8,4)-(12,14)
(8,4)-(12,14)
(8,14)-(11,34)
(8,16)-(11,34)
(9,7)-(11,34)
(11,19)-(11,34)
(11,20)-(11,30)
(12,5)-(12,9)
(12,5)-(12,13)
*)

(* all spans
(2,16)-(4,71)
(3,2)-(4,71)
(3,8)-(3,11)
(3,8)-(3,9)
(3,10)-(3,11)
(4,15)-(4,71)
(4,22)-(4,24)
(4,41)-(4,55)
(4,41)-(4,47)
(4,48)-(4,55)
(4,49)-(4,50)
(4,52)-(4,54)
(4,68)-(4,70)
(6,14)-(12,14)
(7,2)-(12,14)
(7,2)-(7,8)
(8,4)-(12,14)
(8,14)-(11,34)
(8,16)-(11,34)
(9,7)-(11,34)
(9,13)-(9,22)
(9,13)-(9,18)
(9,14)-(9,15)
(9,16)-(9,17)
(9,21)-(9,22)
(10,18)-(10,32)
(10,19)-(10,28)
(10,20)-(10,21)
(10,23)-(10,27)
(10,30)-(10,31)
(11,19)-(11,34)
(11,20)-(11,30)
(11,21)-(11,22)
(11,24)-(11,29)
(11,32)-(11,33)
(12,5)-(12,13)
(12,5)-(12,9)
(12,10)-(12,11)
(12,12)-(12,13)
*)
