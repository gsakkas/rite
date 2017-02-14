
let f' (f,b) = (f b) = b;;

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) = wwhile ((f' (f, b)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

*)

(* changed spans
(2,17)-(2,18)
(2,17)-(2,20)
(2,17)-(2,25)
(2,19)-(2,20)
(2,24)-(2,25)
(4,17)-(5,64)
(5,62)-(5,64)
(7,15)-(7,44)
*)

(* type error slice
(2,4)-(2,27)
(2,9)-(2,25)
(2,17)-(2,25)
(5,9)-(5,10)
(5,9)-(5,12)
(5,42)-(5,48)
(5,42)-(5,55)
(5,50)-(5,51)
(5,50)-(5,55)
(7,22)-(7,28)
(7,22)-(7,44)
(7,31)-(7,33)
(7,31)-(7,39)
(7,31)-(7,44)
*)
