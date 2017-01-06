
let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t -> [mulByDigit i (List.rev (List.map (fun x  -> x * 10) t)); h * i];;



let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @ [h * i];;


(* changed spans
(5,13)-(5,14)
(5,69)-(5,70)
*)

(* type error slice
(5,38)-(5,67)
*)
