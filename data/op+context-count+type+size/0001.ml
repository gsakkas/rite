
let rec listReverse l =
  match l with | [] -> [] | hd::tl -> tl :: (listReverse hd);;



let rec listReverse l =
  match l with | [] -> [] | hd::tl -> hd :: (listReverse tl);;


(* changed spans
(3,39)-(3,41)
(3,58)-(3,60)
*)

(* type error slice
(3,46)-(3,60)
*)
