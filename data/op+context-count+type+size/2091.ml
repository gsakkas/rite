
let rec listReverse l =
  if (List.length l) > 0 then (listReverse List.tl l) @ [List.hd l] else [];;


(* fix

let rec listReverse l = if (List.length l) > 0 then [List.hd l] else [];;

*)

(* changed spans
(3,32)-(3,43)
(3,32)-(3,53)
(3,32)-(3,68)
(3,44)-(3,51)
(3,52)-(3,53)
(3,55)-(3,56)
(3,74)-(3,76)
*)

(* type error slice
(2,4)-(3,78)
(2,21)-(3,76)
(3,3)-(3,76)
(3,7)-(3,18)
(3,7)-(3,20)
(3,19)-(3,20)
(3,32)-(3,43)
(3,32)-(3,53)
(3,32)-(3,68)
(3,44)-(3,51)
(3,52)-(3,53)
(3,55)-(3,56)
(3,57)-(3,68)
*)
