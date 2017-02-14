
let rec wwhile (f,b) =
  let calc = f b in let (b',c') = calc in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((let f x = wwhile (f, x) in f b), b);;


(* fix

let rec wwhile (f,b) =
  let calc = f b in let (b',c') = calc in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> (x, (x = b))), b);;

*)

(* changed spans
(5,31)-(5,61)
(5,41)-(5,47)
(5,41)-(5,53)
(5,49)-(5,50)
(5,58)-(5,61)
(5,64)-(5,65)
*)

(* type error slice
(3,3)-(3,76)
(3,14)-(3,15)
(3,14)-(3,17)
(3,21)-(3,76)
(3,35)-(3,39)
(3,43)-(3,76)
(3,43)-(3,76)
(3,54)-(3,60)
(3,54)-(3,67)
(3,62)-(3,63)
(3,62)-(3,67)
(3,74)-(3,76)
(5,22)-(5,28)
(5,22)-(5,65)
(5,31)-(5,61)
(5,31)-(5,61)
(5,31)-(5,65)
(5,37)-(5,53)
(5,41)-(5,47)
(5,41)-(5,53)
(5,58)-(5,59)
(5,58)-(5,61)
*)
