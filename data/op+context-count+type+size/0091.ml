
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match ((mulByDigit i (List.rev t)) * 10) + (h * i) with | n -> [n]);;



let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @ [h * i];;


(* changed spans
(3,9)-(3,17)
(6,8)-(6,16)
(6,43)-(6,47)
(6,49)-(6,52)
(6,57)-(6,73)
(6,74)-(6,75)
*)

(* type error slice
(3,9)-(3,19)
*)
