
let rec mulByDigit i l =
  match List.rev l with
  | [] -> 0
  | h::t -> (List.rev (List.map (fun x  -> x * 10) t)) + (h * i);;



let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @ [h * i];;


(* changed spans
(4,11)-(4,12)
(5,56)-(5,59)
(5,64)-(5,65)
*)

(* type error slice
(3,9)-(3,19)
*)
