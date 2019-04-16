
let rec listReverse l =
  match l with | [] -> [] | h::t -> [listReverse t] @ [h];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

*)

(* changed spans
(3,37)-(3,52)
listReverse t
AppG (fromList [VarG])

*)

(* type error slice
(2,4)-(3,60)
(2,21)-(3,58)
(3,3)-(3,58)
(3,37)-(3,52)
(3,37)-(3,58)
(3,38)-(3,49)
(3,38)-(3,51)
(3,53)-(3,54)
*)
