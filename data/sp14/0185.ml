
let rec listReverse l =
  match l with | [] -> [] | hd::tl -> tl :: (listReverse hd);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | hd::tl -> hd :: (listReverse tl);;

*)

(* changed spans
(3,38)-(3,40)
(3,57)-(3,59)
*)

(* type error slice
(2,3)-(3,62)
(2,20)-(3,60)
(3,2)-(3,60)
(3,8)-(3,9)
(3,44)-(3,60)
(3,45)-(3,56)
(3,57)-(3,59)
*)

(* all spans
(2,20)-(3,60)
(3,2)-(3,60)
(3,8)-(3,9)
(3,23)-(3,25)
(3,38)-(3,60)
(3,38)-(3,40)
(3,44)-(3,60)
(3,45)-(3,56)
(3,57)-(3,59)
*)
