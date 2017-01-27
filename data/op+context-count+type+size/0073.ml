
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
(4,11)-(4,12)
(5,13)-(5,77)
(5,14)-(5,24)
(5,71)-(5,76)
*)

(* type error slice
(3,3)-(5,77)
(4,11)-(4,12)
(5,13)-(5,77)
*)
