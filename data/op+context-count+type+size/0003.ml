
let rec listReverse l =
  match l with | [] -> [] | hd::tl -> (listReverse tl) :: hd;;



let rec listReverse l = match l with | [] -> [] | _::tl -> listReverse tl;;


(* changed spans
(3,29)-(3,31)
(3,39)-(3,40)
(3,54)-(3,61)
*)

(* type error slice
(3,40)-(3,54)
*)
