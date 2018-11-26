
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
(6,42)-(6,76)
append_new (listReverse tail)
           [head]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(6,53)-(6,64)
listReverse tail
AppG (fromList [VarG])

*)
