
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
mulByDigit i
           (List.rev (List.map (fun x ->
                                  x * 10) t)) @ [h * i]
AppG (fromList [AppG (fromList [EmptyG]),ListG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(5,79)
(2,20)-(5,77)
(2,22)-(5,77)
(3,3)-(5,77)
(5,13)-(5,77)
(5,14)-(5,24)
(5,14)-(5,69)
*)
