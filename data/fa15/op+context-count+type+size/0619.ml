
let rec listReverse l =
  match l with | [] -> [] | h::tl -> (listReverse l) :: h;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::tl -> (listReverse tl) @ [h];;

*)

(* changed spans
(3,39)-(3,52)
(3,39)-(3,58)
(3,51)-(3,52)
(3,57)-(3,58)
*)

(* type error slice
(2,4)-(3,60)
(2,21)-(3,58)
(3,3)-(3,58)
(3,39)-(3,50)
(3,39)-(3,52)
(3,39)-(3,58)
(3,39)-(3,58)
*)
