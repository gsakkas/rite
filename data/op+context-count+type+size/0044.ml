
let rec mulByDigit i l =
  match List.rev l with | [] -> [] | h::t -> [mulByDigit i t; (h * i) mod 10];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> List.append (mulByDigit i t) [(h * i) mod 10];;

*)

(* changed spans
(3,46)-(3,78)
(3,47)-(3,57)
(3,64)-(3,77)
*)

(* type error slice
(2,4)-(3,80)
(2,20)-(3,78)
(2,22)-(3,78)
(3,3)-(3,78)
(3,9)-(3,17)
(3,9)-(3,19)
(3,18)-(3,19)
(3,33)-(3,35)
(3,47)-(3,57)
(3,47)-(3,61)
(3,58)-(3,59)
(3,60)-(3,61)
(3,64)-(3,69)
(3,68)-(3,69)
*)
