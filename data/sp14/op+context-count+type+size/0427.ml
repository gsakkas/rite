
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((f, true), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b
      then fun b''  -> ((f b), false)
      else (fun b''  -> ((f b), true))), b);;

*)

(* changed spans
(4,29)-(4,38)
(4,30)-(4,31)
(4,33)-(4,37)
*)

(* type error slice
(2,37)-(2,38)
(2,37)-(2,40)
(2,55)-(2,61)
(2,55)-(2,69)
(2,62)-(2,69)
(2,63)-(2,64)
(4,21)-(4,27)
(4,21)-(4,42)
(4,28)-(4,42)
(4,29)-(4,38)
*)
