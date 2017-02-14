
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
(5,9)-(5,67)
(5,28)-(5,42)
(5,48)-(5,66)
*)

(* type error slice
(5,9)-(5,67)
(5,9)-(5,67)
(5,28)-(5,42)
(5,29)-(5,34)
(5,30)-(5,31)
(5,48)-(5,66)
(5,49)-(5,62)
(5,50)-(5,55)
(5,51)-(5,52)
*)
