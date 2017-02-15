
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
*)

(* type error slice
(5,12)-(5,45)
(5,41)-(5,42)
(5,43)-(5,44)
*)
