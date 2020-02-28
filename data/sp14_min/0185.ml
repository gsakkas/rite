
let rec listReverse l =
  match l with | [] -> [] | hd::tl -> tl :: (listReverse hd);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | hd::tl -> hd :: (listReverse tl);;

*)

(* changed spans
(3,39)-(3,41)
hd
VarG

(3,58)-(3,60)
tl
VarG

*)

(* type error slice
(2,4)-(3,63)
(2,21)-(3,61)
(3,3)-(3,61)
(3,9)-(3,10)
(3,45)-(3,61)
(3,46)-(3,57)
(3,58)-(3,60)
*)
