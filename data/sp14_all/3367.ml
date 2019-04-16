
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> [((mulByDigit i (List.rev t)) * 10) + (h * i)];;


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

(5,13)-(5,59)
mulByDigit i
           (List.rev (List.map (fun x ->
                                  x * 10) t)) @ [h * i]
AppG (fromList [AppG (fromList [EmptyG]),ListG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(5,61)
(2,20)-(5,59)
(2,22)-(5,59)
(3,3)-(5,59)
(5,13)-(5,59)
(5,14)-(5,48)
(5,15)-(5,42)
(5,16)-(5,26)
*)
