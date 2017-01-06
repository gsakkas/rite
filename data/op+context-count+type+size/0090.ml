
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> [((mulByDigit i (List.rev t)) * 10) + (h * i)];;



let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @ [h * i];;


(* changed spans
(3,9)-(3,17)
(5,13)-(5,14)
(5,15)-(5,16)
(5,43)-(5,47)
(5,49)-(5,52)
(5,57)-(5,58)
*)

(* type error slice
(3,9)-(3,19)
*)
