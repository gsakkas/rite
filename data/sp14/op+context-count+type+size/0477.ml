
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
(5,9)-(5,70)
(5,28)-(5,42)
(5,48)-(5,69)
(5,50)-(5,58)
(5,59)-(5,64)
*)

(* type error slice
(2,37)-(2,38)
(2,37)-(2,40)
(2,55)-(2,61)
(2,55)-(2,69)
(2,62)-(2,69)
(2,63)-(2,64)
(5,2)-(5,8)
(5,2)-(5,70)
(5,9)-(5,70)
(5,9)-(5,70)
(5,13)-(5,18)
(5,13)-(5,22)
(5,13)-(5,22)
(5,14)-(5,15)
(5,21)-(5,22)
(5,28)-(5,42)
(5,29)-(5,34)
(5,30)-(5,31)
(5,36)-(5,41)
(5,48)-(5,69)
(5,67)-(5,68)
*)
