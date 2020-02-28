
let rec listReverse l =
  match l with | [] -> [] | hd::tl -> (listReverse tl) :: hd;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | hd::tl -> hd :: (listReverse tl);;

*)

(* changed spans
(3,39)-(3,55)
hd
VarG

(3,59)-(3,61)
listReverse tl
AppG [VarG]

*)

(* type error slice
(2,4)-(3,63)
(2,21)-(3,61)
(3,3)-(3,61)
(3,39)-(3,55)
(3,39)-(3,61)
(3,40)-(3,51)
*)
