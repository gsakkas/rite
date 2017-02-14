
let rec listReverse l =
  match l with | [] -> [] | h::tl -> (listReverse l) :: h;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::tl -> (listReverse tl) @ [h];;

*)

(* changed spans
(3,37)-(3,52)
(3,37)-(3,57)
(3,50)-(3,51)
(3,56)-(3,57)
*)

(* type error slice
(2,3)-(3,59)
(2,20)-(3,57)
(3,2)-(3,57)
(3,37)-(3,52)
(3,37)-(3,57)
(3,37)-(3,57)
(3,38)-(3,49)
*)
