
let rec mulByDigit i l =
  match List.rev l with
  | [] -> 0
  | h::t -> [mulByDigit i (List.rev (List.map (fun x  -> x * 10) t)); h * i];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @ [h * i];;

*)

(* changed spans
(4,10)-(4,11)
(5,12)-(5,76)
(5,13)-(5,23)
(5,70)-(5,75)
*)

(* type error slice
(3,2)-(5,76)
(3,2)-(5,76)
(4,10)-(4,11)
(5,12)-(5,76)
*)
