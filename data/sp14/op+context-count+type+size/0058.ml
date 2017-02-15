
let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
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
(7,31)-(7,50)
(7,31)-(7,68)
(7,39)-(7,49)
(7,54)-(7,68)
*)

(* type error slice
(6,6)-(8,17)
(6,21)-(7,68)
(7,8)-(7,68)
(7,8)-(7,68)
(7,22)-(7,25)
(7,31)-(7,50)
(7,31)-(7,68)
(7,32)-(7,38)
(7,39)-(7,49)
(7,54)-(7,68)
(7,55)-(7,58)
(8,6)-(8,12)
(8,6)-(8,17)
(8,13)-(8,15)
*)
