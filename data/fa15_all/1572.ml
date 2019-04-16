
let rec listReverse l =
  match l with | [] -> l | hd::tail -> (listReverse tail) @ hd;;


(* fix

let rec listReverse l =
  match l with | [] -> l | hd::tail -> (listReverse tail) @ [hd];;

*)

(* changed spans
(3,61)-(3,63)
[hd]
ListG (fromList [VarG])

*)

(* type error slice
(3,3)-(3,63)
(3,9)-(3,10)
(3,24)-(3,25)
(3,40)-(3,63)
(3,59)-(3,60)
(3,61)-(3,63)
*)
