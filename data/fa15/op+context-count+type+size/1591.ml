
let rec wwhile (f,b) = let temp = f b in wwhile (temp, b);;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  let (b',c') = temp in if c' = true then wwhile (f, b') else b';;

*)

(* changed spans
(2,23)-(2,57)
(2,41)-(2,47)
(2,41)-(2,57)
(2,48)-(2,57)
(2,55)-(2,56)
*)

(* type error slice
(2,3)-(2,59)
(2,16)-(2,57)
(2,23)-(2,57)
(2,34)-(2,35)
(2,34)-(2,37)
(2,41)-(2,47)
(2,41)-(2,57)
(2,48)-(2,57)
(2,49)-(2,53)
*)
