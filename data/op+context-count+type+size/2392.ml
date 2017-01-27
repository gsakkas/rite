
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let f x = (f, ((f b) = b)) in wwhile ((f b), b);;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let f x = ((f x), ((f b) = b)) in wwhile (f, b);;

*)

(* changed spans
(7,33)-(7,34)
(7,38)-(7,46)
(7,61)-(7,64)
(7,67)-(7,68)
*)

(* type error slice
(2,4)-(5,28)
(2,13)-(5,25)
(3,3)-(5,25)
(4,29)-(4,35)
(4,29)-(4,47)
(4,37)-(4,38)
(4,37)-(4,41)
(4,40)-(4,41)
(5,3)-(5,9)
(5,3)-(5,25)
(5,11)-(5,12)
(5,11)-(5,15)
(5,14)-(5,15)
(5,18)-(5,19)
(5,18)-(5,25)
(5,21)-(5,25)
(7,22)-(7,68)
(7,28)-(7,46)
(7,33)-(7,34)
(7,33)-(7,46)
(7,38)-(7,46)
(7,52)-(7,58)
(7,52)-(7,68)
(7,61)-(7,62)
(7,61)-(7,64)
(7,61)-(7,68)
(7,63)-(7,64)
(7,67)-(7,68)
*)
