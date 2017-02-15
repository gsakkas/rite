
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
(2,15)-(3,65)
(3,16)-(3,17)
(3,16)-(3,24)
(5,19)-(11,17)
(5,21)-(11,17)
(6,2)-(11,17)
(6,8)-(6,9)
(7,10)-(7,12)
(9,6)-(11,17)
(9,17)-(10,68)
(9,21)-(10,68)
(10,8)-(10,68)
(10,11)-(10,12)
*)

(* type error slice
(3,30)-(3,36)
(3,30)-(3,65)
(3,37)-(3,56)
(9,6)-(11,17)
(9,17)-(10,68)
(10,8)-(10,68)
(10,8)-(10,68)
(10,22)-(10,25)
(10,31)-(10,50)
(10,31)-(10,68)
(10,32)-(10,38)
(10,39)-(10,49)
(10,54)-(10,68)
(10,55)-(10,58)
(11,6)-(11,12)
(11,6)-(11,17)
(11,13)-(11,15)
*)
