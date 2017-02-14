
let g x f = ((f x), ((f x) = x));;

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((g b f), b);;


(* fix

let h x = ((x * x), (x < 100));;

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(2,9)-(2,31)
(2,15)-(2,16)
(2,15)-(2,18)
(2,23)-(2,24)
(2,23)-(2,26)
(2,23)-(2,31)
(2,30)-(2,31)
(4,17)-(5,62)
*)

(* type error slice
(2,4)-(2,35)
(2,7)-(2,31)
(2,9)-(2,31)
(2,15)-(2,31)
(5,9)-(5,10)
(5,9)-(5,12)
(5,50)-(5,56)
(5,50)-(5,62)
(5,58)-(5,59)
(5,58)-(5,62)
(7,22)-(7,28)
(7,22)-(7,40)
(7,31)-(7,32)
(7,31)-(7,36)
(7,31)-(7,40)
*)
