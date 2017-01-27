
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
(3,3)-(5,64)
(5,14)-(5,22)
(5,14)-(5,53)
(5,14)-(5,64)
(5,24)-(5,32)
(5,24)-(5,53)
(5,34)-(5,50)
(5,44)-(5,45)
(5,44)-(5,50)
(5,52)-(5,53)
*)
