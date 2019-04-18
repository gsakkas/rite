
let rec listReverse l =
  match l with | [] -> l | h::t -> listReverse (h :: l) t;;


(* fix

let rec listReverse l = match l with | [] -> l | h::t -> listReverse (h :: l);;

*)

(* changed spans
(3,36)-(3,58)
listReverse (h :: l)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(3,60)
(2,21)-(3,58)
(3,3)-(3,58)
(3,36)-(3,47)
(3,36)-(3,58)
*)
