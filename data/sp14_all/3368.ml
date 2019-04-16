
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
(3,9)-(3,19)
l
VarG

(6,7)-(6,75)
mulByDigit i
           (List.rev (List.map (fun x ->
                                  x * 10) t)) @ [h * i]
AppG (fromList [AppG (fromList [EmptyG]),ListG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(6,77)
(2,20)-(6,75)
(2,22)-(6,75)
(3,3)-(6,75)
(6,7)-(6,75)
(6,14)-(6,48)
(6,15)-(6,42)
(6,16)-(6,26)
(6,71)-(6,74)
*)
