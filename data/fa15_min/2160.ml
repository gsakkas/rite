
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> if b f b then b else f b), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> ((f b), ((f b) = b))), b);;

*)

(* changed spans
(5,41)-(5,65)
(f b , f b = b)
TupleG [AppG [EmptyG],BopG EmptyG EmptyG]

*)

(* type error slice
(3,3)-(3,64)
(3,17)-(3,18)
(3,17)-(3,20)
(3,42)-(3,48)
(3,42)-(3,56)
(3,49)-(3,56)
(3,50)-(3,51)
(5,22)-(5,28)
(5,22)-(5,70)
(5,29)-(5,70)
(5,30)-(5,66)
(5,41)-(5,65)
(5,44)-(5,45)
(5,44)-(5,49)
(5,48)-(5,49)
(5,55)-(5,56)
*)
