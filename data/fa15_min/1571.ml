
let rec listReverse l =
  match l with | [] -> l | hd::tail -> (listReverse tail) :: hd;;


(* fix

let rec listReverse l =
  match l with | [] -> l | hd::tail -> (listReverse tail) @ [hd];;

*)

(* changed spans
(3,40)-(3,64)
listReverse tail @ [hd]
AppG [AppG [EmptyG],ListG [EmptyG]]

*)

(* type error slice
(3,3)-(3,64)
(3,9)-(3,10)
(3,24)-(3,25)
(3,40)-(3,64)
(3,62)-(3,64)
*)
