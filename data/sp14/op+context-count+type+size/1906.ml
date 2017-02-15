
let rec listReverse l =
  if (List.length l) > 0 then (listReverse List.tl l) @ [List.hd l] else [];;


(* fix

let rec listReverse l = if (List.length l) > 0 then [List.hd l] else [];;

*)

(* changed spans
(3,30)-(3,53)
(3,30)-(3,67)
(3,31)-(3,42)
(3,43)-(3,50)
(3,51)-(3,52)
(3,54)-(3,55)
(3,57)-(3,66)
*)

(* type error slice
(2,3)-(3,77)
(2,20)-(3,75)
(3,30)-(3,53)
(3,31)-(3,42)
(3,43)-(3,50)
(3,57)-(3,64)
(3,57)-(3,66)
(3,65)-(3,66)
*)
