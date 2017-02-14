
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> (((mulByDigit i (List.rev t)) * 10) h) * i;;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @ [h * i];;

*)

(* changed spans
(5,16)-(5,26)
(5,16)-(5,47)
(5,16)-(5,50)
(5,16)-(5,55)
(5,39)-(5,40)
(5,45)-(5,47)
(5,49)-(5,50)
(5,54)-(5,55)
*)

(* type error slice
(2,4)-(5,57)
(2,20)-(5,55)
(2,22)-(5,55)
(3,3)-(5,55)
(3,3)-(5,55)
(4,11)-(4,13)
(5,16)-(5,26)
(5,16)-(5,40)
(5,16)-(5,47)
(5,16)-(5,47)
(5,16)-(5,50)
(5,16)-(5,55)
*)
