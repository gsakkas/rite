
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
(8,6)-(12,14)
(8,17)-(11,34)
(9,8)-(11,34)
(9,15)-(9,16)
(9,15)-(9,18)
(9,15)-(9,23)
(9,17)-(9,18)
(9,22)-(9,23)
(10,21)-(10,22)
(10,21)-(10,32)
(10,31)-(10,32)
(12,6)-(12,14)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(4,42)-(4,48)
(4,42)-(4,55)
(4,50)-(4,51)
(4,50)-(4,55)
(7,3)-(7,9)
(7,3)-(12,14)
(8,6)-(12,14)
(8,6)-(12,14)
(8,15)-(11,34)
(8,17)-(11,34)
(9,8)-(11,34)
(11,22)-(11,30)
(11,22)-(11,34)
(12,6)-(12,10)
(12,6)-(12,14)
*)
