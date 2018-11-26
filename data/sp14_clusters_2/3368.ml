
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
(6,15)-(6,25)
(@)
VarG

(6,15)-(6,25)
mulByDigit i
           (List.rev (List.map (fun x ->
                                  x * 10) t))
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(6,38)-(6,39)
List.map (fun x -> x * 10) t
AppG (fromList [VarG,LamG EmptyG])

(6,44)-(6,46)
List.map
VarG

(6,44)-(6,46)
x
VarG

(6,44)-(6,46)
fun x -> x * 10
LamG (BopG EmptyG EmptyG)

(6,44)-(6,46)
x * 10
BopG VarG LitG

(6,50)-(6,57)
t
VarG

(6,50)-(6,57)
[h * i]
ListG (BopG EmptyG EmptyG) Nothing

*)
