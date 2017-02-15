
let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (let h x y = ((y x), (x = x)) in ((h b f), b));;


(* fix

let h x = ((x * x), (x < 100));;

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(2,16)-(3,62)
(5,28)-(5,74)
(5,35)-(5,57)
(5,37)-(5,57)
(5,42)-(5,47)
(5,43)-(5,44)
(5,45)-(5,46)
(5,49)-(5,56)
(5,50)-(5,51)
(5,54)-(5,55)
(5,61)-(5,73)
(5,62)-(5,69)
*)

(* type error slice
(3,8)-(3,9)
(3,8)-(3,11)
(3,49)-(3,55)
(3,49)-(3,62)
(3,56)-(3,62)
(3,57)-(3,58)
(5,21)-(5,27)
(5,21)-(5,74)
(5,28)-(5,74)
(5,28)-(5,74)
(5,35)-(5,57)
(5,37)-(5,57)
(5,41)-(5,57)
(5,61)-(5,73)
(5,62)-(5,69)
(5,63)-(5,64)
*)
