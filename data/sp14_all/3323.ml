
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> ((mulByDigit i (List.rev t)) :: 0) @ [h * i];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> ((mulByDigit i (List.rev t)) @ [0]) @ [h * i];;

*)

(* changed spans
(5,13)-(5,47)
mulByDigit i
           (List.rev t) @ [0]
AppG [AppG [EmptyG,EmptyG],ListG [EmptyG]]

*)

(* type error slice
(2,4)-(5,59)
(2,20)-(5,57)
(2,22)-(5,57)
(3,3)-(5,57)
(5,13)-(5,47)
(5,13)-(5,57)
(5,14)-(5,41)
(5,15)-(5,25)
(5,45)-(5,46)
(5,48)-(5,49)
*)
