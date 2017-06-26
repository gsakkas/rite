
let rec listReverse l =
  match l with | [] -> [] | hd::tl -> [listReverse tl; hd];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | hd::tl -> (listReverse tl) @ [hd];;

*)

(* changed spans
(3,38)-(3,58)
(3,39)-(3,53)
(3,55)-(3,57)
*)

(* type error slice
(2,3)-(3,60)
(2,20)-(3,58)
(3,2)-(3,58)
(3,38)-(3,58)
(3,39)-(3,50)
(3,39)-(3,53)
*)

(* all spans
(2,20)-(3,58)
(3,2)-(3,58)
(3,8)-(3,9)
(3,23)-(3,25)
(3,38)-(3,58)
(3,39)-(3,53)
(3,39)-(3,50)
(3,51)-(3,53)
(3,55)-(3,57)
*)
