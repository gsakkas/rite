
let f x = let xx = (x * x) * x in (xx, (xx < 100));;

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let (x,y) = f 8;;

let fixpoint (f,b) = let f x = (f, ((f b) = b)) in wwhile (f, x);;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let f x = ((f x), ((f b) = b)) in wwhile (f, b);;

*)

(* changed spans
(11,33)-(11,34)
f x
AppG (fromList [VarG])

(11,63)-(11,64)
b
VarG

*)

(* type error slice
(2,4)-(2,53)
(2,7)-(2,51)
(2,11)-(2,51)
(2,20)-(2,31)
(2,35)-(2,51)
(2,36)-(2,38)
(4,4)-(7,28)
(4,13)-(7,26)
(6,29)-(6,35)
(6,29)-(6,48)
(6,36)-(6,42)
(6,37)-(6,38)
(6,43)-(6,48)
(6,44)-(6,45)
(7,3)-(7,9)
(7,3)-(7,26)
(7,10)-(7,16)
(7,11)-(7,12)
(7,17)-(7,26)
(7,18)-(7,19)
(9,4)-(9,18)
(9,13)-(9,14)
(9,13)-(9,16)
(11,22)-(11,65)
(11,28)-(11,48)
(11,32)-(11,48)
(11,33)-(11,34)
(11,37)-(11,42)
(11,38)-(11,39)
(11,52)-(11,58)
(11,52)-(11,65)
(11,59)-(11,65)
(11,60)-(11,61)
(11,63)-(11,64)
*)
