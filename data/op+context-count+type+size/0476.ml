
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile ((if (f b) = b then (b, (failwith "asd")) else failwith "asd"), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b
      then fun b''  -> ((f b), false)
      else (fun b''  -> ((f b), true))), b);;

*)

(* changed spans
(5,31)-(5,32)
(5,31)-(5,49)
(5,35)-(5,43)
(5,44)-(5,49)
(5,57)-(5,65)
(5,57)-(5,71)
(5,66)-(5,71)
*)

(* type error slice
(2,38)-(2,39)
(2,38)-(2,41)
(2,40)-(2,41)
(2,56)-(2,62)
(2,56)-(2,69)
(2,64)-(2,65)
(2,64)-(2,69)
(2,67)-(2,69)
(5,3)-(5,9)
(5,3)-(5,75)
(5,12)-(5,71)
(5,12)-(5,75)
(5,31)-(5,32)
(5,31)-(5,49)
(5,74)-(5,75)
*)
