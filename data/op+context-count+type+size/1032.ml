
let rec listReverse l =
  match l with | [] -> [] | _::tl -> (listReverse tl) + tl;;


(* fix

let rec listReverse l = match l with | [] -> [] | _::tl -> listReverse tl;;

*)

(* changed spans
(3,39)-(3,59)
(3,57)-(3,59)
*)

(* type error slice
(2,4)-(3,61)
(2,21)-(3,59)
(3,3)-(3,59)
(3,9)-(3,10)
(3,24)-(3,26)
(3,39)-(3,50)
(3,39)-(3,53)
(3,39)-(3,59)
(3,51)-(3,53)
(3,57)-(3,59)
*)
