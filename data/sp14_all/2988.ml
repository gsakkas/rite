
let rec listReverse l =
  if List.length > 0 then (listReverse List.tl l) @ [List.hd l] else [];;


(* fix

let rec listReverse l = if (List.length l) > 0 then [List.hd l] else [];;

*)

(* changed spans
(3,6)-(3,17)
List.length l
AppG (fromList [VarG])

(3,27)-(3,64)
[List.hd l]
ListG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(3,74)
(2,21)-(3,72)
(3,6)-(3,17)
(3,6)-(3,21)
(3,20)-(3,21)
(3,27)-(3,50)
(3,28)-(3,39)
(3,40)-(3,47)
(3,54)-(3,61)
(3,54)-(3,63)
(3,62)-(3,63)
*)
