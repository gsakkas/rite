
let rec mulByDigit i l =
  match List.rev l with
  | [] -> 0
  | h::t ->
      let rec helper acc v =
        if v = 0 then 0 :: acc else helper ((v mod 10) :: acc) (v / 10) in
      (helper ((mulByDigit i (List.rev t)) * 10)) + (h * i);;



let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      helper [] h;;


(* changed spans
(3,9)-(3,17)
(4,11)-(4,12)
(7,23)-(7,27)
(8,7)-(8,8)
(8,15)-(8,54)
(8,56)-(8,60)
*)

(* type error slice
(3,9)-(3,19)
*)
