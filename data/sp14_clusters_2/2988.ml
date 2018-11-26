
let rec listReverse l =
  if List.length > 0 then (listReverse List.tl l) @ [List.hd l] else [];;


(* fix

let rec listReverse l = if (List.length l) > 0 then [List.hd l] else [];;

*)

(* changed spans
(3,5)-(3,16)
List.length l
AppG (fromList [VarG])

(3,52)-(3,63)
0
LitG

*)
