
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (mulByDigit i (List.rev (List.map (fun x  -> [x * 10]) t))) @ [h * i];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @ [h * i];;

*)

(* changed spans
(6,51)-(6,59)
*)

(* type error slice
(2,3)-(6,77)
(2,19)-(6,75)
(2,21)-(6,75)
(3,2)-(6,75)
(3,2)-(6,75)
(3,8)-(3,16)
(3,8)-(3,18)
(3,17)-(3,18)
(6,6)-(6,65)
(6,7)-(6,17)
(6,20)-(6,64)
(6,21)-(6,29)
(6,30)-(6,63)
(6,31)-(6,39)
(6,40)-(6,60)
(6,51)-(6,59)
(6,52)-(6,53)
(6,52)-(6,58)
(6,61)-(6,62)
*)
