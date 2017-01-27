
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (if (f b) = b then ((f b), false) else (((f b), true), b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b
      then fun b''  -> ((f b), false)
      else (fun b''  -> ((f b), true))), b);;

*)

(* changed spans
(5,11)-(5,66)
(5,31)-(5,42)
(5,52)-(5,66)
*)

(* type error slice
(5,11)-(5,66)
(5,15)-(5,16)
(5,15)-(5,18)
(5,17)-(5,18)
(5,31)-(5,32)
(5,31)-(5,34)
(5,31)-(5,42)
(5,33)-(5,34)
(5,37)-(5,42)
(5,52)-(5,62)
(5,52)-(5,66)
(5,58)-(5,62)
(5,65)-(5,66)
*)
