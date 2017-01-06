
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (mulByDigit i (List.rev (List.map (fun x  -> [x * 10]) t))) @ [h * i];;



let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @ [h * i];;


(* changed spans
(6,52)-(6,53)
(6,59)-(6,60)
*)

(* type error slice
(3,9)-(3,19)
*)
