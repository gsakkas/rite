
let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((let h a = ((f a), false) in h b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (let h x = ((f x), false) in (h, b));;

*)

(* changed spans
(5,28)-(5,66)
(5,36)-(5,54)
(5,44)-(5,45)
(5,58)-(5,61)
(5,64)-(5,65)
*)

(* type error slice
(3,8)-(3,9)
(3,8)-(3,11)
(3,49)-(3,55)
(3,49)-(3,62)
(3,56)-(3,62)
(3,57)-(3,58)
(5,21)-(5,27)
(5,21)-(5,66)
(5,28)-(5,66)
(5,29)-(5,62)
(5,29)-(5,62)
(5,36)-(5,54)
(5,40)-(5,54)
(5,58)-(5,59)
(5,58)-(5,61)
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
(5,14)-(5,66)
(5,21)-(5,66)
(5,21)-(5,27)
(5,28)-(5,66)
(5,29)-(5,62)
(5,36)-(5,54)
(5,40)-(5,54)
(5,41)-(5,46)
(5,42)-(5,43)
(5,44)-(5,45)
(5,48)-(5,53)
(5,58)-(5,61)
(5,58)-(5,59)
(5,60)-(5,61)
(5,64)-(5,65)
*)
