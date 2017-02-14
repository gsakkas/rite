
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
