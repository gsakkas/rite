
let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile (((f b) = (let rr = f b in (rr, (rr = b)))), b);;


(* fix

let helper (f,b) = let f b = let x = f b in (x, (x != b)) in f;;

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((helper (f, b)), b);;

*)

(* changed spans
(3,2)-(3,72)
(5,29)-(5,71)
(5,31)-(5,32)
(5,33)-(5,34)
(5,38)-(5,70)
(5,48)-(5,49)
(5,48)-(5,51)
(5,50)-(5,51)
(5,56)-(5,58)
(5,60)-(5,68)
(5,61)-(5,63)
*)

(* type error slice
(3,14)-(3,15)
(3,14)-(3,17)
(3,59)-(3,65)
(3,59)-(3,72)
(3,66)-(3,72)
(3,67)-(3,68)
(5,21)-(5,27)
(5,21)-(5,75)
(5,28)-(5,75)
(5,29)-(5,71)
(5,29)-(5,71)
(5,29)-(5,71)
(5,30)-(5,35)
(5,31)-(5,32)
(5,38)-(5,70)
(5,38)-(5,70)
(5,48)-(5,49)
(5,48)-(5,51)
(5,55)-(5,69)
(5,56)-(5,58)
*)

(* all spans
(2,16)-(3,72)
(3,2)-(3,72)
(3,14)-(3,17)
(3,14)-(3,15)
(3,16)-(3,17)
(3,21)-(3,72)
(3,27)-(3,28)
(3,46)-(3,47)
(3,59)-(3,72)
(3,59)-(3,65)
(3,66)-(3,72)
(3,67)-(3,68)
(3,70)-(3,71)
(5,14)-(5,75)
(5,21)-(5,75)
(5,21)-(5,27)
(5,28)-(5,75)
(5,29)-(5,71)
(5,30)-(5,35)
(5,31)-(5,32)
(5,33)-(5,34)
(5,38)-(5,70)
(5,48)-(5,51)
(5,48)-(5,49)
(5,50)-(5,51)
(5,55)-(5,69)
(5,56)-(5,58)
(5,60)-(5,68)
(5,61)-(5,63)
(5,66)-(5,67)
(5,73)-(5,74)
*)
