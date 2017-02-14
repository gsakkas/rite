
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
(5,12)-(5,52)
*)

(* type error slice
(5,12)-(5,52)
(5,32)-(5,52)
*)
