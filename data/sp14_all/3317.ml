
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::m::t -> ((h * i) mod 10) :: (((h * i) / 10) + (m * i));;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::m::t -> [(h * i) mod 10; ((h * i) / 10) + (m * i)];;

*)

(* changed spans
(5,16)-(5,62)
[(h * i) mod 10 ; ((h * i) / 10) + (m * i)]
ListG (fromList [BopG EmptyG EmptyG])

*)

(* type error slice
(5,16)-(5,62)
(5,36)-(5,62)
*)
