
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> [(mulByDigit i t) ((h * i) mod 10)];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> List.append (mulByDigit i t) [h * i];;

*)

(* changed spans
(5,14)-(5,24)
List.append
VarG

(5,14)-(5,24)
mulByDigit i t
AppG (fromList [VarG])

(5,30)-(5,46)
[h * i]
ListG (BopG EmptyG EmptyG) Nothing

*)
