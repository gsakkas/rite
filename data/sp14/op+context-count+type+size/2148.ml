
let h x b = ((b x), false);;

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((h b f), b);;


(* fix

let h x = ((x * x), (x < 100));;

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(2,8)-(2,26)
(2,13)-(2,18)
(2,14)-(2,15)
(2,20)-(2,25)
(4,16)-(5,62)
(7,29)-(7,36)
(7,34)-(7,35)
(7,38)-(7,39)
*)

(* type error slice
(2,3)-(2,28)
(2,6)-(2,26)
(2,8)-(2,26)
(2,12)-(2,26)
(5,8)-(5,9)
(5,8)-(5,11)
(5,49)-(5,55)
(5,49)-(5,62)
(5,56)-(5,62)
(5,57)-(5,58)
(7,21)-(7,27)
(7,21)-(7,40)
(7,28)-(7,40)
(7,29)-(7,36)
(7,30)-(7,31)
*)
