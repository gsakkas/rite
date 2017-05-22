
let rec assoc (d,k,l) =
  match l with | [] -> (-1) | h::l' -> let (x,y) = h in print_int h;;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> (-1)
  | h::l' -> let (x,y) = h in (match x with | k -> y | _ -> assoc (d, k, l'));;

*)

(* changed spans
(3,56)-(3,65)
(3,56)-(3,67)
(3,66)-(3,67)
*)

(* type error slice
(3,39)-(3,67)
(3,51)-(3,52)
(3,56)-(3,65)
(3,56)-(3,67)
(3,66)-(3,67)
*)

(* all spans
(2,15)-(3,67)
(3,2)-(3,67)
(3,8)-(3,9)
(3,23)-(3,27)
(3,39)-(3,67)
(3,51)-(3,52)
(3,56)-(3,67)
(3,56)-(3,65)
(3,66)-(3,67)
*)
