
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> [(mulByDigit i t) ((h * i) mod 10)];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> List.append (mulByDigit i t) [h * i];;

*)

(* changed spans
(5,13)-(5,48)
List.append (mulByDigit i t)
            [h * i]
AppG (fromList [AppG (fromList [EmptyG]),ListG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(5,50)
(2,20)-(5,48)
(2,22)-(5,48)
(3,3)-(5,48)
(5,13)-(5,48)
(5,14)-(5,30)
(5,14)-(5,47)
(5,15)-(5,25)
*)
