
let rec mulByDigit i l =
  match List.rev l with | [] -> [] | h::t -> [mulByDigit i t; (h * i) mod 10];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> List.append (mulByDigit i t) [(h * i) mod 10];;

*)

(* changed spans
(3,46)-(3,56)
List.append
VarG

(3,46)-(3,56)
mulByDigit i t
AppG (fromList [VarG])

(3,62)-(3,76)
[(h * i) mod 10]
ListG (BopG EmptyG EmptyG) Nothing

*)
