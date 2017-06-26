
let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (let h x y = ((y x), false) in ((h b f), b));;


(* fix

let h x = ((x * x), (x < 100));;

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(2,16)-(3,62)
(5,28)-(5,72)
(5,35)-(5,55)
(5,37)-(5,55)
(5,42)-(5,47)
(5,43)-(5,44)
(5,45)-(5,46)
(5,49)-(5,54)
(5,59)-(5,71)
(5,60)-(5,67)
(5,65)-(5,66)
(5,69)-(5,70)
*)

(* type error slice
(3,8)-(3,9)
(3,8)-(3,11)
(3,49)-(3,55)
(3,49)-(3,62)
(3,56)-(3,62)
(3,57)-(3,58)
(5,21)-(5,27)
(5,21)-(5,72)
(5,28)-(5,72)
(5,35)-(5,55)
(5,37)-(5,55)
(5,41)-(5,55)
(5,59)-(5,71)
(5,60)-(5,67)
(5,61)-(5,62)
*)

(* all spans
(2,16)-(3,62)
(3,2)-(3,62)
(3,8)-(3,11)
(3,8)-(3,9)
(3,10)-(3,11)
(3,28)-(3,62)
(3,31)-(3,36)
(3,31)-(3,34)
(3,35)-(3,36)
(3,42)-(3,43)
(3,49)-(3,62)
(3,49)-(3,55)
(3,56)-(3,62)
(3,57)-(3,58)
(3,60)-(3,61)
(5,14)-(5,72)
(5,21)-(5,72)
(5,21)-(5,27)
(5,28)-(5,72)
(5,35)-(5,55)
(5,37)-(5,55)
(5,41)-(5,55)
(5,42)-(5,47)
(5,43)-(5,44)
(5,45)-(5,46)
(5,49)-(5,54)
(5,59)-(5,71)
(5,60)-(5,67)
(5,61)-(5,62)
(5,63)-(5,64)
(5,65)-(5,66)
(5,69)-(5,70)
*)
