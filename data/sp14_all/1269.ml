
let rec append_new xs1 xs2 =
  match xs1 with | [] -> xs2 | head::tail -> head :: (append_new tail xs2);;

let rec listReverse l =
  match l with | [] -> [] | head::tail -> append_new listReverse tail [head];;


(* fix

let rec append_new xs1 xs2 =
  match xs1 with | [] -> xs2 | head::tail -> head :: (append_new tail xs2);;

let rec listReverse l =
  match l with
  | [] -> []
  | head::tail -> append_new (listReverse tail) [head];;

*)

(* changed spans
(6,43)-(6,77)
append_new (listReverse tail)
           [head]
AppG (fromList [AppG (fromList [EmptyG]),ListG (fromList [EmptyG])])

*)

(* type error slice
(3,46)-(3,75)
(3,54)-(3,75)
(3,55)-(3,65)
(6,43)-(6,53)
(6,43)-(6,77)
*)
