
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> [mulByDigit i (List.rev (List.map (fun x  -> x * 10) t)); h * i];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @ [h * i];;

*)

(* changed spans
(5,13)-(5,77)
(5,14)-(5,24)
(5,71)-(5,76)
*)

(* type error slice
(2,4)-(5,79)
(2,20)-(5,77)
(2,22)-(5,77)
(3,3)-(5,77)
(3,9)-(3,17)
(3,9)-(3,19)
(3,18)-(3,19)
(4,11)-(4,13)
(5,14)-(5,24)
(5,14)-(5,67)
(5,25)-(5,26)
(5,28)-(5,36)
(5,28)-(5,67)
(5,38)-(5,46)
(5,38)-(5,67)
(5,48)-(5,64)
(5,58)-(5,59)
(5,58)-(5,64)
(5,66)-(5,67)
(5,71)-(5,76)
(5,75)-(5,76)
*)
