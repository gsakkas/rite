
let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else (helper (v mod 10)) :: (acc (v / 10)) in
      helper [] h;;



let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      helper [] h;;


(* changed spans
(7,32)-(7,33)
(7,50)-(7,51)
(7,55)-(7,56)
(7,68)-(7,69)
*)

(* type error slice
(7,9)-(7,67)
(7,56)-(7,67)
*)
