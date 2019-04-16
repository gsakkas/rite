
let rec listReverse l =
  match l with | [] -> [] | _::tl -> (listReverse tl) + tl;;


(* fix

let rec listReverse l = match l with | [] -> [] | _::tl -> listReverse tl;;

*)

(* changed spans
(3,38)-(3,59)
listReverse tl
AppG (fromList [VarG])

*)

(* type error slice
(2,4)-(3,61)
(2,21)-(3,59)
(3,3)-(3,59)
(3,24)-(3,26)
(3,38)-(3,54)
(3,38)-(3,59)
(3,39)-(3,50)
(3,57)-(3,59)
*)
