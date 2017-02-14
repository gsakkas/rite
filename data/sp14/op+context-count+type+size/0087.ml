
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match ((mulByDigit i (List.rev t)) * 10) + (h * i) with | n -> [n]);;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @ [h * i];;

*)

(* changed spans
(3,9)-(3,17)
(3,9)-(3,19)
(6,8)-(6,74)
(6,16)-(6,26)
(6,16)-(6,47)
(6,16)-(6,57)
(6,39)-(6,40)
(6,45)-(6,47)
(6,52)-(6,57)
(6,71)-(6,74)
(6,72)-(6,73)
*)

(* type error slice
(2,4)-(6,77)
(2,20)-(6,74)
(2,22)-(6,74)
(3,3)-(6,74)
(6,8)-(6,74)
(6,16)-(6,26)
(6,16)-(6,40)
(6,16)-(6,47)
(6,71)-(6,74)
*)
