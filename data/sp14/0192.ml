
let rec listReverse l =
  match l with | [] -> [] | hd::tl -> listReverse (hd :: l) tl;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | hd::tl -> listReverse (hd :: l);;

*)

(* changed spans
(3,38)-(3,62)
(3,60)-(3,62)
*)

(* type error slice
(2,3)-(3,64)
(2,20)-(3,62)
(3,2)-(3,62)
(3,38)-(3,49)
(3,38)-(3,62)
*)

(* all spans
(2,20)-(3,62)
(3,2)-(3,62)
(3,8)-(3,9)
(3,23)-(3,25)
(3,38)-(3,62)
(3,38)-(3,49)
(3,50)-(3,59)
(3,51)-(3,53)
(3,57)-(3,58)
(3,60)-(3,62)
*)
