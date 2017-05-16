
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
(2,6)-(2,50)
(2,10)-(2,50)
(2,19)-(2,26)
(2,19)-(2,30)
(2,20)-(2,21)
(2,24)-(2,25)
(2,29)-(2,30)
(2,34)-(2,50)
(2,35)-(2,37)
(2,39)-(2,49)
(2,40)-(2,42)
(2,45)-(2,48)
(9,12)-(9,13)
(9,12)-(9,15)
(9,14)-(9,15)
(11,32)-(11,33)
(11,35)-(11,46)
(11,62)-(11,63)
*)

(* type error slice
(2,3)-(2,52)
(2,6)-(2,50)
(2,10)-(2,50)
(2,10)-(2,50)
(2,19)-(2,30)
(2,34)-(2,50)
(2,35)-(2,37)
(4,3)-(7,27)
(4,12)-(7,25)
(6,28)-(6,34)
(6,28)-(6,47)
(6,35)-(6,41)
(6,36)-(6,37)
(6,42)-(6,47)
(6,43)-(6,44)
(7,2)-(7,8)
(7,2)-(7,25)
(7,9)-(7,15)
(7,10)-(7,11)
(7,16)-(7,25)
(7,17)-(7,18)
(9,3)-(9,17)
(9,12)-(9,13)
(9,12)-(9,15)
(11,21)-(11,64)
(11,27)-(11,47)
(11,31)-(11,47)
(11,32)-(11,33)
(11,36)-(11,41)
(11,37)-(11,38)
(11,51)-(11,57)
(11,51)-(11,64)
(11,58)-(11,64)
(11,59)-(11,60)
(11,62)-(11,63)
*)

(* all spans
(2,6)-(2,50)
(2,10)-(2,50)
(2,19)-(2,30)
(2,19)-(2,26)
(2,20)-(2,21)
(2,24)-(2,25)
(2,29)-(2,30)
(2,34)-(2,50)
(2,35)-(2,37)
(2,39)-(2,49)
(2,40)-(2,42)
(2,45)-(2,48)
(4,12)-(7,25)
(5,2)-(7,25)
(5,18)-(6,61)
(5,24)-(6,61)
(6,4)-(6,61)
(6,10)-(6,11)
(6,28)-(6,47)
(6,28)-(6,34)
(6,35)-(6,41)
(6,36)-(6,37)
(6,39)-(6,40)
(6,42)-(6,47)
(6,43)-(6,44)
(6,45)-(6,46)
(6,60)-(6,61)
(7,2)-(7,25)
(7,2)-(7,8)
(7,9)-(7,15)
(7,10)-(7,11)
(7,13)-(7,14)
(7,16)-(7,25)
(7,17)-(7,18)
(7,20)-(7,24)
(9,12)-(9,15)
(9,12)-(9,13)
(9,14)-(9,15)
(11,14)-(11,64)
(11,21)-(11,64)
(11,27)-(11,47)
(11,31)-(11,47)
(11,32)-(11,33)
(11,35)-(11,46)
(11,36)-(11,41)
(11,37)-(11,38)
(11,39)-(11,40)
(11,44)-(11,45)
(11,51)-(11,64)
(11,51)-(11,57)
(11,58)-(11,64)
(11,59)-(11,60)
(11,62)-(11,63)
*)
