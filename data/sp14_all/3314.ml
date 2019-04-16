
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> ((h * i) mod 10) :: (((h * i) / 10) + h);;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> [(h * i) mod 10; ((h * i) / 10) + h];;

*)

(* changed spans
(5,13)-(5,53)
[(h * i) mod 10 ; ((h * i) / 10) + h]
ListG (fromList [BopG EmptyG EmptyG])

*)

(* type error slice
(5,13)-(5,53)
(5,33)-(5,53)
*)
