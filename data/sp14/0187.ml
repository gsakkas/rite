
let rec listReverse l =
  match l with | [] -> [] | hd::tl -> (listReverse tl) :: hd;;


(* fix

let rec listReverse l = match l with | [] -> [] | _::tl -> listReverse tl;;

*)

(* changed spans
(3,2)-(3,60)
(3,38)-(3,60)
(3,58)-(3,60)
*)

(* type error slice
(2,3)-(3,62)
(2,20)-(3,60)
(3,2)-(3,60)
(3,38)-(3,54)
(3,38)-(3,60)
(3,39)-(3,50)
*)

(* all spans
(2,20)-(3,60)
(3,2)-(3,60)
(3,8)-(3,9)
(3,23)-(3,25)
(3,38)-(3,60)
(3,38)-(3,54)
(3,39)-(3,50)
(3,51)-(3,53)
(3,58)-(3,60)
*)
