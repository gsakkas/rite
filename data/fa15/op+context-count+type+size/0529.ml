
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (let func x = f x in (f, (not ((f b) = b)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((fun x  -> ((f b), (3 < 4))), b);;

*)

(* changed spans
(5,30)-(5,74)
(5,43)-(5,46)
(5,45)-(5,46)
(5,51)-(5,52)
(5,51)-(5,74)
(5,55)-(5,58)
(5,55)-(5,69)
(5,61)-(5,64)
(5,61)-(5,69)
(5,73)-(5,74)
*)

(* type error slice
(3,50)-(3,56)
(3,50)-(3,62)
(3,58)-(3,62)
(5,22)-(5,28)
(5,22)-(5,74)
(5,30)-(5,74)
(5,51)-(5,74)
*)
