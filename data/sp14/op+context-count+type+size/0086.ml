
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
(3,8)-(3,16)
(3,8)-(3,18)
(5,12)-(5,58)
(5,13)-(5,47)
(5,13)-(5,57)
(5,15)-(5,25)
(5,38)-(5,39)
(5,44)-(5,46)
(5,50)-(5,57)
(5,51)-(5,52)
(5,55)-(5,56)
*)

(* type error slice
(2,3)-(5,60)
(2,19)-(5,58)
(2,21)-(5,58)
(3,2)-(5,58)
(5,12)-(5,58)
(5,13)-(5,47)
(5,14)-(5,41)
(5,15)-(5,25)
*)
