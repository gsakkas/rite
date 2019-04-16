
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
(6,52)-(6,60)
x * 10
BopG VarG LitG

*)

(* type error slice
(2,4)-(6,78)
(2,20)-(6,76)
(2,22)-(6,76)
(3,3)-(6,76)
(3,9)-(3,17)
(3,9)-(3,19)
(3,18)-(3,19)
(6,7)-(6,66)
(6,8)-(6,18)
(6,21)-(6,65)
(6,22)-(6,30)
(6,31)-(6,64)
(6,32)-(6,40)
(6,41)-(6,61)
(6,52)-(6,60)
(6,53)-(6,54)
(6,53)-(6,59)
(6,62)-(6,63)
*)
