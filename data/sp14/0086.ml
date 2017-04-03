
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
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
(9,27)-(9,28)
(9,27)-(9,35)
(10,21)-(10,22)
*)

(* type error slice
(2,3)-(10,25)
(2,19)-(10,23)
(2,21)-(10,23)
(3,2)-(10,23)
(6,6)-(10,23)
(6,13)-(6,47)
(6,14)-(6,41)
(6,15)-(6,25)
(8,11)-(10,22)
(9,13)-(9,76)
(9,13)-(9,76)
(9,27)-(9,35)
(9,41)-(9,47)
(9,41)-(9,76)
(10,11)-(10,17)
(10,11)-(10,22)
*)

(* all spans
(2,19)-(10,23)
(2,21)-(10,23)
(3,2)-(10,23)
(3,8)-(3,18)
(3,8)-(3,16)
(3,17)-(3,18)
(4,10)-(4,12)
(6,6)-(10,23)
(6,13)-(6,57)
(6,13)-(6,47)
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
(8,30)-(9,76)
(9,13)-(9,76)
(9,16)-(9,21)
(9,16)-(9,17)
(9,20)-(9,21)
(9,27)-(9,35)
(9,27)-(9,28)
(9,32)-(9,35)
(9,41)-(9,76)
(9,41)-(9,47)
(9,48)-(9,67)
(9,49)-(9,59)
(9,50)-(9,51)
(9,56)-(9,58)
(9,63)-(9,66)
(9,68)-(9,76)
(9,69)-(9,70)
(9,73)-(9,75)
(10,11)-(10,22)
(10,11)-(10,17)
(10,18)-(10,20)
(10,21)-(10,22)
*)
