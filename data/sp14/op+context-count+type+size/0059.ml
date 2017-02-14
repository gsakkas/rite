
let rec mulByDigit i l =
  match List.rev l with
  | [] -> 0
  | h::t -> (((mulByDigit i (List.rev t)) * 10) h) * i;;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @ [h * i];;

*)

(* changed spans
(4,10)-(4,11)
(5,12)-(5,50)
(5,12)-(5,54)
(5,13)-(5,47)
(5,15)-(5,25)
(5,38)-(5,39)
(5,44)-(5,46)
(5,48)-(5,49)
(5,53)-(5,54)
*)

(* type error slice
(5,12)-(5,50)
(5,13)-(5,47)
*)
