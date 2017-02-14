
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (if (f b) = b then ((f b), false) else ((failwith "asd"), b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b
      then fun b''  -> ((f b), false)
      else (fun b''  -> ((f b), true))), b);;

*)

(* changed spans
(5,11)-(5,69)
(5,31)-(5,42)
(5,51)-(5,59)
(5,51)-(5,69)
(5,60)-(5,65)
*)

(* type error slice
(2,38)-(2,39)
(2,38)-(2,41)
(2,56)-(2,62)
(2,56)-(2,69)
(2,64)-(2,65)
(2,64)-(2,69)
(5,3)-(5,9)
(5,3)-(5,69)
(5,11)-(5,69)
(5,11)-(5,69)
(5,15)-(5,16)
(5,15)-(5,18)
(5,15)-(5,23)
(5,15)-(5,23)
(5,22)-(5,23)
(5,31)-(5,32)
(5,31)-(5,34)
(5,31)-(5,42)
(5,37)-(5,42)
(5,51)-(5,69)
(5,68)-(5,69)
*)
