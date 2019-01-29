
let rec listReverse l =
  match l with | [] -> [] | hd::tl -> tl :: (listReverse hd);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | hd::tl -> hd :: (listReverse tl);;

*)

(* changed spans
(3,38)-(3,40)
hd
VarG

(3,57)-(3,59)
tl
VarG

*)
