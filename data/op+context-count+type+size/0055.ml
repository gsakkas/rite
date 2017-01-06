
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> ((mulByDigit i (List.rev t)) :: 0) @ [h * i];;



let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> ((mulByDigit i (List.rev t)) @ [0]) @ [h * i];;


(* changed spans
(5,42)-(5,44)
*)

(* type error slice
(3,9)-(3,19)
*)
