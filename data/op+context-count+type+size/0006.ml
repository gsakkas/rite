
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
(2,21)-(2,22)
(4,21)-(5,63)
*)

(* type error slice
(4,4)-(5,65)
(4,21)-(5,63)
(5,3)-(5,63)
(5,9)-(5,10)
(5,24)-(5,26)
(5,45)-(5,56)
(5,45)-(5,59)
(5,57)-(5,59)
*)
