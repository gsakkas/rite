
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let f x = x in wwhile (f, b);;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let g b = (b, (f b)) in wwhile (g, b);;

*)

(* changed spans
(7,21)-(7,49)
(7,27)-(7,32)
(7,31)-(7,32)
(7,36)-(7,42)
(7,36)-(7,49)
(7,43)-(7,49)
(7,44)-(7,45)
*)

(* type error slice
(2,3)-(5,27)
(2,12)-(5,25)
(3,2)-(5,25)
(3,18)-(4,61)
(4,28)-(4,34)
(4,28)-(4,47)
(4,42)-(4,47)
(4,43)-(4,44)
(4,45)-(4,46)
(5,2)-(5,8)
(5,2)-(5,25)
(5,9)-(5,15)
(5,10)-(5,11)
(5,13)-(5,14)
(5,16)-(5,25)
(5,17)-(5,18)
(7,21)-(7,49)
(7,27)-(7,32)
(7,31)-(7,32)
(7,36)-(7,42)
(7,36)-(7,49)
(7,43)-(7,49)
(7,44)-(7,45)
*)
