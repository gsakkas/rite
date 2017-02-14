
let rec mulByDigit i l =
  match List.rev l with | [] -> [] | h::t -> [mulByDigit i t; (h * i) mod 10];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> List.append (mulByDigit i t) [(h * i) mod 10];;

*)

(* changed spans
(3,45)-(3,77)
(3,46)-(3,56)
(3,62)-(3,76)
*)

(* type error slice
(2,3)-(3,79)
(2,19)-(3,77)
(2,21)-(3,77)
(3,2)-(3,77)
(3,45)-(3,77)
(3,45)-(3,77)
(3,46)-(3,56)
(3,46)-(3,60)
*)
