
let rec wwhile (f,b) = let (i,t) = f b in if t then wwhile (f, i) else i;;

let fixpoint (f,b) = wwhile ((let (i,t) = f b in i = b), b);;


(* fix

let rec wwhile (f,b) = let (i,t) = f b in if t then wwhile (f, i) else i;;

let fixpoint (f,b) =
  wwhile
    ((let g b = let xx = f b in if b = xx then (xx, false) else (xx, true) in
      g), b);;

*)

(* changed spans
(4,31)-(4,55)
(4,43)-(4,46)
(4,50)-(4,51)
(4,50)-(4,55)
(4,58)-(4,59)
*)

(* type error slice
(2,36)-(2,37)
(2,36)-(2,39)
(2,53)-(2,59)
(2,53)-(2,65)
(2,61)-(2,62)
(2,61)-(2,65)
(4,22)-(4,28)
(4,22)-(4,59)
(4,31)-(4,55)
(4,31)-(4,59)
(4,50)-(4,55)
*)
