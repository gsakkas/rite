
let rec mulByDigit i l =
  match List.rev l with
  | [] -> 0
  | h::t -> (List.rev (List.map (fun x  -> x * 10) t)) + (h * i);;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @ [h * i];;

*)

(* changed spans
(4,11)-(4,12)
(5,14)-(5,53)
(5,14)-(5,64)
(5,59)-(5,60)
(5,59)-(5,64)
(5,63)-(5,64)
*)

(* type error slice
(5,14)-(5,22)
(5,14)-(5,53)
(5,14)-(5,64)
*)
