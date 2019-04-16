
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse l) :: h;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse l) @ [h];;

*)

(* changed spans
(3,37)-(3,57)
listReverse l @ [h]
AppG (fromList [AppG (fromList [EmptyG]),ListG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(3,59)
(2,21)-(3,57)
(3,3)-(3,57)
(3,37)-(3,52)
(3,37)-(3,57)
(3,38)-(3,49)
*)
