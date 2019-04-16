
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
(5,13)-(5,55)
mulByDigit i
           (List.rev (List.map (fun x ->
                                  x * 10) t)) @ [h * i]
AppG (fromList [AppG (fromList [EmptyG]),ListG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(5,57)
(2,20)-(5,55)
(2,22)-(5,55)
(3,3)-(5,55)
(4,11)-(4,13)
(5,13)-(5,51)
(5,13)-(5,55)
(5,14)-(5,48)
(5,15)-(5,42)
(5,16)-(5,26)
*)
