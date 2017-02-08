
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((not f), ((f b) = b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(3,31)-(3,64)
(5,31)-(5,34)
(5,31)-(5,36)
(5,31)-(5,53)
(5,35)-(5,36)
(5,41)-(5,42)
(5,41)-(5,44)
(5,41)-(5,49)
(5,43)-(5,44)
*)

(* type error slice
(3,42)-(3,48)
(3,42)-(3,55)
(3,50)-(3,55)
(5,22)-(5,28)
(5,22)-(5,53)
(5,31)-(5,34)
(5,31)-(5,36)
(5,31)-(5,53)
(5,35)-(5,36)
(5,41)-(5,42)
(5,41)-(5,44)
*)
