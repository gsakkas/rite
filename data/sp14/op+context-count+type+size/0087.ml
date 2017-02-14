
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match ((mulByDigit i (List.rev t)) * 10) + (h * i) with | n -> [n]);;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @ [h * i];;

*)

(* changed spans
(3,8)-(3,16)
(3,8)-(3,18)
(6,6)-(6,74)
(6,13)-(6,47)
(6,13)-(6,57)
(6,15)-(6,25)
(6,38)-(6,39)
(6,44)-(6,46)
(6,50)-(6,57)
(6,70)-(6,73)
(6,71)-(6,72)
*)

(* type error slice
(2,3)-(6,76)
(2,19)-(6,74)
(2,21)-(6,74)
(3,2)-(6,74)
(6,6)-(6,74)
(6,13)-(6,47)
(6,14)-(6,41)
(6,15)-(6,25)
(6,70)-(6,73)
*)
