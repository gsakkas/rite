
let rec listReverse l =
  match l with | [] -> [] | hd::tl -> tl :: (listReverse hd);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | hd::tl -> hd :: (listReverse tl);;

*)

(* changed spans
(3,39)-(3,41)
(3,58)-(3,60)
*)

(* type error slice
(2,4)-(3,63)
(2,21)-(3,60)
(3,3)-(3,60)
(3,9)-(3,10)
(3,24)-(3,26)
(3,46)-(3,57)
(3,46)-(3,60)
(3,58)-(3,60)
*)
