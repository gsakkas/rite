
let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t -> [mulByDigit i (List.rev (List.map (fun x  -> x * 10) t)); h * i];;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @ [h * i];;

*)

(* changed spans
(5,12)-(5,76)
(5,13)-(5,23)
(5,70)-(5,75)
*)

(* type error slice
(2,3)-(5,78)
(2,19)-(5,76)
(2,21)-(5,76)
(3,2)-(5,76)
(5,12)-(5,76)
(5,12)-(5,76)
(5,13)-(5,23)
(5,13)-(5,68)
*)
