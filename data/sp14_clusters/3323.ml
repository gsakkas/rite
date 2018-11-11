
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> ((mulByDigit i (List.rev t)) :: 0) @ [h * i];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> ((mulByDigit i (List.rev t)) @ [0]) @ [h * i];;

*)

(* changed spans
(5,14)-(5,24)
(@)
VarG

(5,14)-(5,24)
mulByDigit i (List.rev t)
AppG [VarG,AppG [EmptyG]]

(5,44)-(5,45)
[0]
ListG LitG Nothing

*)
