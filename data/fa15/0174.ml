
let rec listReverse l =
  match l with | [] -> [] | h::tl -> (listReverse l) :: h;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::tl -> (listReverse tl) @ [h];;

*)

(* changed spans
(3,38)-(3,58)
listReverse tl @ [h]
AppG [AppG [EmptyG],ListG [EmptyG]]

*)

(* type error slice
(2,4)-(3,60)
(2,21)-(3,58)
(3,3)-(3,58)
(3,38)-(3,53)
(3,38)-(3,58)
(3,39)-(3,50)
*)
