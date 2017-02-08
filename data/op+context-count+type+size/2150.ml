
let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((let h a = ((f a), false) in h b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (let h x = ((f x), false) in (h, b));;

*)

(* changed spans
(5,31)-(5,62)
(5,31)-(5,66)
(5,37)-(5,54)
(5,43)-(5,54)
(5,45)-(5,46)
(5,59)-(5,62)
(5,65)-(5,66)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,50)-(3,56)
(3,50)-(3,62)
(3,58)-(3,59)
(3,58)-(3,62)
(5,22)-(5,28)
(5,22)-(5,66)
(5,31)-(5,62)
(5,31)-(5,62)
(5,31)-(5,66)
(5,37)-(5,54)
(5,43)-(5,54)
(5,59)-(5,60)
(5,59)-(5,62)
*)
