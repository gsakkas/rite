
let rec wwhile (f,b) =
  let y = f b in match y with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (f, b);;

let fixpoint (f,b) = if b = (f b) then b else fixpoint (f, (f b));;


(* fix

let rec wwhile (f,b) =
  let y = f b in match y with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let f' b = ((f b), (b != (f b))) in wwhile (f', b);;

*)

(* changed spans
(5,22)-(5,28)
(5,22)-(5,34)
(5,30)-(5,31)
(5,30)-(5,34)
(7,15)-(7,64)
(7,22)-(7,64)
(7,25)-(7,33)
(7,40)-(7,41)
(7,47)-(7,55)
(7,57)-(7,58)
(7,61)-(7,64)
*)

(* type error slice
(3,11)-(3,12)
(3,11)-(3,14)
(3,13)-(3,14)
(3,55)-(3,61)
(3,55)-(3,68)
(3,63)-(3,64)
(3,63)-(3,68)
(3,66)-(3,68)
(5,4)-(5,37)
(5,15)-(5,34)
(5,22)-(5,28)
(5,22)-(5,34)
(5,30)-(5,31)
(5,30)-(5,34)
(5,33)-(5,34)
(7,30)-(7,31)
(7,30)-(7,33)
(7,32)-(7,33)
(7,47)-(7,55)
(7,47)-(7,64)
(7,57)-(7,58)
(7,57)-(7,64)
*)
