
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let y = ((f b), (b = (f b))) in wwhile (y, b);;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let y x = ((f b), (b = (f b))) in wwhile (y, b);;

*)

(* changed spans
(7,29)-(7,49)
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
(7,21)-(7,66)
(7,29)-(7,49)
(7,53)-(7,59)
(7,53)-(7,66)
(7,60)-(7,66)
(7,61)-(7,62)
*)
