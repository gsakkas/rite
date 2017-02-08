
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = if (wwhile (f, b)) = b then b else wwhile (f, (f b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) =
  wwhile ((let f x = let xx = (x * x) * x in (xx, (xx < 100)) in f), b);;

*)

(* changed spans
(5,22)-(5,72)
(5,26)-(5,44)
(5,34)-(5,35)
(5,37)-(5,38)
(5,43)-(5,44)
(5,50)-(5,51)
(5,57)-(5,63)
(5,57)-(5,72)
(5,65)-(5,66)
(5,65)-(5,72)
(5,69)-(5,70)
(5,69)-(5,72)
*)

(* type error slice
(3,3)-(3,62)
(3,9)-(3,10)
(3,9)-(3,12)
(3,50)-(3,56)
(3,50)-(3,62)
(3,58)-(3,59)
(3,58)-(3,62)
(3,61)-(3,62)
(5,57)-(5,63)
(5,57)-(5,72)
(5,65)-(5,66)
(5,65)-(5,72)
(5,69)-(5,70)
(5,69)-(5,72)
*)
