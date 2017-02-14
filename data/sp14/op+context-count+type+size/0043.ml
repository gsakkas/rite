
let rec mulByDigit i l =
  match List.rev l with
  | [] -> 0
  | h::t -> [((h * i) / 10) + (mulByDigit i t); (h * i) mod 10];;


(* fix

let rec mulByDigit i l =
  match List.rev l with | [] -> [] | h::t -> [(h * i) mod 10];;

*)

(* changed spans
(4,10)-(4,11)
(5,12)-(5,63)
(5,13)-(5,27)
(5,13)-(5,46)
(5,14)-(5,21)
(5,30)-(5,46)
(5,48)-(5,62)
*)

(* type error slice
(3,2)-(5,63)
(3,2)-(5,63)
(4,10)-(4,11)
(5,12)-(5,63)
*)
