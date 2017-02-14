
let rec wwhile (f,b) = let (bs,cs) = f b in if cs then f bs else bs;;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

*)

(* changed spans
(2,23)-(2,67)
(2,47)-(2,49)
(2,55)-(2,56)
(2,57)-(2,59)
(2,65)-(2,67)
*)

(* type error slice
(2,23)-(2,67)
(2,37)-(2,38)
(2,37)-(2,40)
(2,44)-(2,67)
(2,44)-(2,67)
(2,55)-(2,56)
(2,55)-(2,59)
(2,65)-(2,67)
*)
