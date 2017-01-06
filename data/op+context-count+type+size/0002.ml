
let rec listReverse l =
  match l with
  | [] -> []
  | hd::tl -> if hd != [] then (listReverse tl) :: hd else hd;;



let rec listReverse l = match l with | [] -> [] | _::tl -> listReverse tl;;


(* changed spans
(5,5)-(5,7)
(5,15)-(5,33)
(5,47)-(5,62)
*)

(* type error slice
(5,33)-(5,47)
*)
