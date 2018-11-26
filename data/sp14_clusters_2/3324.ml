
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> ((mulByDigit i (List.rev t)) @ 0) @ [h * i];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> ((mulByDigit i (List.rev t)) @ [0]) @ [h * i];;

*)

(* changed spans
(5,43)-(5,44)
[0]
ListG LitG Nothing

*)
