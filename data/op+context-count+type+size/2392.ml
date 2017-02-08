
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = wwhile ((let f b = b in b), b);;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let g b = (b, (f b)) in wwhile (g, b);;

*)

(* changed spans
(7,22)-(7,28)
(7,22)-(7,51)
(7,31)-(7,47)
(7,31)-(7,51)
(7,41)-(7,42)
(7,50)-(7,51)
*)

(* type error slice
(2,4)-(5,28)
(2,13)-(5,25)
(4,29)-(4,35)
(4,29)-(4,47)
(4,37)-(4,38)
(4,37)-(4,41)
(4,44)-(4,45)
(4,44)-(4,47)
(5,3)-(5,9)
(5,3)-(5,25)
(5,11)-(5,12)
(5,11)-(5,15)
(5,18)-(5,19)
(5,18)-(5,25)
(7,22)-(7,28)
(7,22)-(7,51)
(7,31)-(7,47)
(7,31)-(7,51)
(7,46)-(7,47)
(7,50)-(7,51)
*)
