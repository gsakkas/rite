
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> [((h * i) / 10) + (mulByDigit i t); (h * i) mod 10];;


(* fix

let rec mulByDigit i l =
  match List.rev l with | [] -> [] | h::t -> [(h * i) mod 10];;

*)

(* changed spans
(5,13)-(5,64)
(5,16)-(5,21)
(5,16)-(5,27)
(5,16)-(5,46)
(5,32)-(5,46)
(5,50)-(5,63)
*)

(* type error slice
(2,4)-(5,66)
(2,20)-(5,64)
(2,22)-(5,64)
(3,3)-(5,64)
(5,13)-(5,64)
(5,16)-(5,46)
(5,32)-(5,42)
(5,32)-(5,46)
*)
