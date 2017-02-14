
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
(3,9)-(3,17)
(3,9)-(3,19)
(4,11)-(4,12)
(6,8)-(10,23)
(6,16)-(6,26)
(6,16)-(6,40)
(6,16)-(6,47)
(6,16)-(6,57)
(6,27)-(6,28)
(6,30)-(6,38)
(6,30)-(6,40)
(6,39)-(6,40)
(6,45)-(6,47)
(6,52)-(6,53)
(6,52)-(6,57)
(6,56)-(6,57)
(8,12)-(10,23)
(8,27)-(9,76)
(9,28)-(9,36)
(10,12)-(10,23)
*)

(* type error slice
(3,3)-(10,23)
(3,3)-(10,23)
(4,11)-(4,12)
(6,8)-(10,23)
(8,12)-(10,23)
(9,14)-(9,76)
(9,14)-(9,76)
(9,28)-(9,36)
(9,42)-(9,48)
(9,42)-(9,76)
(10,12)-(10,18)
(10,12)-(10,23)
*)
