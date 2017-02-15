
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
(5,29)-(5,50)
(5,30)-(5,31)
(5,34)-(5,42)
(5,43)-(5,48)
(5,56)-(5,64)
(5,56)-(5,70)
(5,65)-(5,70)
*)

(* type error slice
(2,37)-(2,38)
(2,37)-(2,40)
(2,55)-(2,61)
(2,55)-(2,69)
(2,62)-(2,69)
(2,63)-(2,64)
(5,2)-(5,8)
(5,2)-(5,75)
(5,9)-(5,75)
(5,10)-(5,71)
(5,29)-(5,50)
*)
