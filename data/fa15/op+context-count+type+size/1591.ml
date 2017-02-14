
let rec wwhile (f,b) = let temp = f b in wwhile (temp, b);;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  let (b',c') = temp in if c' = true then wwhile (f, b') else b';;

*)

(* changed spans
(2,24)-(2,57)
(2,42)-(2,48)
(2,42)-(2,57)
(2,50)-(2,57)
(2,56)-(2,57)
*)

(* type error slice
(2,4)-(2,60)
(2,17)-(2,57)
(2,24)-(2,57)
(2,35)-(2,36)
(2,35)-(2,38)
(2,42)-(2,48)
(2,42)-(2,57)
(2,50)-(2,54)
(2,50)-(2,57)
*)
