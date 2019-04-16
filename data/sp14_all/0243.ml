
let rec digitsOfInt n = match n with | [] -> [] | n -> if n > 0 then 0;;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [];;

*)

(* changed spans
(2,25)-(2,71)
if n < 0 then [] else []
IteG (BopG EmptyG EmptyG) (ListG (fromList [])) (ListG (fromList []))

*)

(* type error slice
(2,25)-(2,71)
(2,56)-(2,71)
(2,59)-(2,60)
(2,59)-(2,64)
(2,63)-(2,64)
(2,70)-(2,71)
(2,71)-(2,71)
*)
