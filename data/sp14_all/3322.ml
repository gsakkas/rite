
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> [mulByDigit i (List.rev l); h * i];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> (mulByDigit i (List.rev l)) @ [h * i];;

*)

(* changed spans
(5,13)-(5,47)
mulByDigit i
           (List.rev l) @ [h * i]
AppG [AppG [EmptyG,EmptyG],ListG [EmptyG]]

*)

(* type error slice
(2,4)-(5,49)
(2,20)-(5,47)
(2,22)-(5,47)
(3,3)-(5,47)
(5,13)-(5,47)
(5,14)-(5,24)
(5,14)-(5,39)
*)
