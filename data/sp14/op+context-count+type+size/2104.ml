
let rec listReverse l =
  if List.length > 0 then (listReverse List.tl l) @ [List.hd l] else [];;


(* fix

let rec listReverse l = if (List.length l) > 0 then [List.hd l] else [];;

*)

(* changed spans
(3,5)-(3,16)
(3,19)-(3,20)
(3,26)-(3,49)
(3,26)-(3,63)
(3,27)-(3,38)
(3,39)-(3,46)
(3,50)-(3,51)
(3,52)-(3,63)
(3,69)-(3,71)
*)

(* type error slice
(2,3)-(3,73)
(2,20)-(3,71)
(3,5)-(3,16)
(3,5)-(3,20)
(3,5)-(3,20)
(3,19)-(3,20)
(3,26)-(3,49)
(3,27)-(3,38)
(3,39)-(3,46)
(3,53)-(3,60)
(3,53)-(3,62)
(3,61)-(3,62)
*)
