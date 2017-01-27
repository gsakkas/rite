
let rec listReverse l =
  match l with | [] -> [] | hd::tl -> (listReverse tl) :: hd;;


(* fix

let rec listReverse l = match l with | [] -> [] | _::tl -> listReverse tl;;

*)

(* changed spans
(3,3)-(3,61)
(3,40)-(3,61)
(3,59)-(3,61)
*)

(* type error slice
(2,4)-(3,63)
(2,21)-(3,61)
(3,3)-(3,61)
(3,9)-(3,10)
(3,24)-(3,26)
(3,40)-(3,51)
(3,40)-(3,54)
(3,52)-(3,54)
*)
