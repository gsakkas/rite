
let rec mulByDigit i l =
  match List.rev l with
  | [] -> 0
  | h::t -> [((h * i) / 10) + (mulByDigit i t); (h * i) mod 10];;


(* fix

let rec mulByDigit i l =
  match List.rev l with | [] -> [] | h::t -> [(h * i) mod 10];;

*)

(* changed spans
(4,11)-(4,12)
(5,13)-(5,64)
(5,16)-(5,21)
(5,16)-(5,27)
(5,16)-(5,46)
(5,32)-(5,46)
(5,50)-(5,63)
*)

(* type error slice
(3,3)-(5,64)
(3,3)-(5,64)
(4,11)-(4,12)
(5,13)-(5,64)
*)
