
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
(5,15)-(5,61)
[(h * i) mod 10 ; ((h * i) / 10) + (m * i)]
ListG (BopG EmptyG EmptyG) Nothing

*)
