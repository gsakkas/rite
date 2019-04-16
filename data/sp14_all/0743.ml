
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
(5,29)-(5,75)
(h , b)
TupleG (fromList [VarG])

*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,50)-(3,56)
(3,50)-(3,63)
(3,57)-(3,63)
(3,58)-(3,59)
(5,22)-(5,28)
(5,22)-(5,75)
(5,29)-(5,75)
(5,36)-(5,58)
(5,38)-(5,58)
(5,42)-(5,58)
(5,62)-(5,74)
(5,63)-(5,70)
(5,64)-(5,65)
*)
