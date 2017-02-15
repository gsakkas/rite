
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let g b = b in wwhile ((g, true), b);;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let g b = (b, (f b)) in wwhile (g, b);;

*)

(* changed spans
(7,31)-(7,32)
(7,36)-(7,42)
(7,44)-(7,53)
(7,48)-(7,52)
*)

(* type error slice
(2,3)-(5,27)
(2,12)-(5,25)
(4,28)-(4,34)
(4,28)-(4,47)
(4,35)-(4,41)
(4,36)-(4,37)
(4,42)-(4,47)
(4,43)-(4,44)
(5,2)-(5,8)
(5,2)-(5,25)
(5,9)-(5,15)
(5,10)-(5,11)
(7,36)-(7,42)
(7,36)-(7,57)
(7,43)-(7,57)
(7,44)-(7,53)
*)
