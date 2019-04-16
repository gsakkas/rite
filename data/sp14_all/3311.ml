
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
[]
ListG (fromList [])

(5,13)-(5,64)
[(h * i) mod 10]
ListG (fromList [BopG EmptyG EmptyG])

*)

(* type error slice
(3,3)-(5,64)
(4,11)-(4,12)
(5,13)-(5,64)
*)
