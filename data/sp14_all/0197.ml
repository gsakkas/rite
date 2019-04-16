
let join x l = x :: l;;

let rec listReverse l =
  match l with | [] -> [] | hd::tl -> join (listReverse tl) hd;;


(* fix

let join x l = l :: x;;

let rec listReverse l =
  match l with | [] -> [] | hd::tl -> join (listReverse tl) hd;;

*)

(* changed spans
(2,16)-(2,17)
l
VarG

(2,21)-(2,22)
x
VarG

*)

(* type error slice
(2,4)-(2,24)
(2,10)-(2,22)
(2,12)-(2,22)
(2,16)-(2,17)
(2,16)-(2,22)
(4,4)-(5,65)
(4,21)-(5,63)
(5,3)-(5,63)
(5,39)-(5,43)
(5,39)-(5,63)
(5,44)-(5,60)
(5,45)-(5,56)
*)
