
let rec helper acc v =
  if v = 0 then 0 :: acc else helper ((v mod 10) :: acc) (v / 10);;

let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      let helper acc v =
        if v = 0 then acc else (helper (v mod 10)) :: (acc (v / 10)) in
      helper [] h;;


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
(2,16)-(3,65)
(3,17)-(3,18)
(3,17)-(3,25)
(5,20)-(11,18)
(5,22)-(11,18)
(6,3)-(11,18)
(6,9)-(6,10)
(7,11)-(7,13)
(9,7)-(11,18)
(9,18)-(10,67)
(9,22)-(10,67)
(10,9)-(10,67)
*)

(* type error slice
(3,31)-(3,37)
(3,31)-(3,65)
(3,40)-(3,56)
(9,7)-(11,18)
(9,18)-(10,67)
(10,9)-(10,67)
(10,9)-(10,67)
(10,23)-(10,26)
(10,33)-(10,39)
(10,33)-(10,49)
(10,33)-(10,67)
(10,41)-(10,49)
(10,56)-(10,59)
(10,56)-(10,67)
(11,7)-(11,13)
(11,7)-(11,18)
(11,14)-(11,16)
*)
