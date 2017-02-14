
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> [((mulByDigit i (List.rev t)) * 10) + (h * i)];;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @ [h * i];;

*)

(* changed spans
(3,9)-(3,17)
(3,9)-(3,19)
(5,13)-(5,59)
(5,16)-(5,26)
(5,16)-(5,47)
(5,16)-(5,57)
(5,39)-(5,40)
(5,45)-(5,47)
(5,52)-(5,53)
(5,52)-(5,57)
(5,56)-(5,57)
*)

(* type error slice
(2,4)-(5,61)
(2,20)-(5,59)
(2,22)-(5,59)
(3,3)-(5,59)
(5,13)-(5,59)
(5,16)-(5,26)
(5,16)-(5,40)
(5,16)-(5,47)
*)
