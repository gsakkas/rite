
let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t -> [mulByDigit i (List.rev (List.map (fun x  -> x * 10) t)); h * i];;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @ [h * i];;

*)

(* changed spans
(5,13)-(5,23)
(@)
VarG

(5,13)-(5,23)
mulByDigit i
           (List.rev (List.map (fun x ->
                                  x * 10) t))
AppG [VarG,AppG [EmptyG]]

(5,70)-(5,75)
[h * i]
ListG (BopG EmptyG EmptyG) Nothing

*)
