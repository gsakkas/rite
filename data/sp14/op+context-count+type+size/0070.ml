
let rec mulByDigit i l =
  match List.rev l with
  | [] -> 0
  | h::t ->
      (match ((mulByDigit i (List.rev t)) * 10) + (h * i) with
       | n ->
           let rec helper acc v =
             if v = 0 then 0 :: acc else helper ((v mod 10) :: acc) (v / 10) in
           helper [] n);;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      helper [] h;;

*)

(* changed spans
(3,8)-(3,16)
(3,8)-(3,18)
(4,10)-(4,11)
(6,6)-(10,23)
(6,13)-(6,47)
(6,13)-(6,57)
(6,14)-(6,41)
(6,15)-(6,25)
(6,26)-(6,27)
(6,28)-(6,40)
(6,29)-(6,37)
(6,38)-(6,39)
(6,44)-(6,46)
(6,50)-(6,57)
(6,51)-(6,52)
(6,55)-(6,56)
(8,11)-(10,22)
(8,26)-(9,76)
(9,27)-(9,35)
(10,11)-(10,22)
*)

(* type error slice
(3,2)-(10,23)
(3,2)-(10,23)
(4,10)-(4,11)
(6,6)-(10,23)
(8,11)-(10,22)
(9,13)-(9,76)
(9,13)-(9,76)
(9,27)-(9,35)
(9,41)-(9,47)
(9,41)-(9,76)
(10,11)-(10,17)
(10,11)-(10,22)
*)
