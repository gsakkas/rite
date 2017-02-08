
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
(5,18)-(5,60)
*)

(* type error slice
(5,18)-(5,60)
(5,39)-(5,60)
*)
