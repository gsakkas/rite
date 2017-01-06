
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::m::t -> ((h * i) mod 10) :: (((h * i) / 10) + (m * i));;



let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::m::t -> [(h * i) mod 10; ((h * i) / 10) + (m * i)];;


(* changed spans
(5,16)-(5,17)
(5,31)-(5,37)
(5,61)-(5,62)
*)

(* type error slice
(3,9)-(3,19)
*)
