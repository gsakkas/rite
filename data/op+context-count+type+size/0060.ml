
let rec mulByDigit i l =
  match List.rev l with
  | [] -> 0
  | h::t -> (((mulByDigit i (List.rev t)) * 10) h) * i;;



let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @ [h * i];;


(* changed spans
(4,11)-(4,12)
(5,14)-(5,16)
(5,43)-(5,47)
(5,50)-(5,51)
*)

(* type error slice
(3,9)-(3,19)
*)
