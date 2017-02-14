
let rec assoc (d,k,l) =
  match l with | [] -> (-1) | h::l' -> let (x,y) = h in print_int y;;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> (-1)
  | h::l' -> let (x,y) = h in (match x with | k -> y | _ -> assoc (d, k, l'));;

*)

(* changed spans
(3,40)-(3,68)
(3,57)-(3,66)
(3,57)-(3,68)
(3,67)-(3,68)
*)

(* type error slice
(3,3)-(3,68)
(3,3)-(3,68)
(3,25)-(3,27)
(3,40)-(3,68)
(3,57)-(3,66)
(3,57)-(3,68)
*)
