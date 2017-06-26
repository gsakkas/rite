
let rec listReverse l =
  match l with | 0 -> [] | _::tl -> (listReverse tl) + tl;;


(* fix

let rec listReverse l = match l with | [] -> [] | _::tl -> listReverse tl;;

*)

(* changed spans
(3,2)-(3,57)
(3,36)-(3,57)
(3,55)-(3,57)
*)

(* type error slice
(3,2)-(3,57)
(3,22)-(3,24)
(3,36)-(3,57)
(3,55)-(3,57)
*)

(* all spans
(2,20)-(3,57)
(3,2)-(3,57)
(3,8)-(3,9)
(3,22)-(3,24)
(3,36)-(3,57)
(3,36)-(3,52)
(3,37)-(3,48)
(3,49)-(3,51)
(3,55)-(3,57)
*)
