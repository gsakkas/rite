
let rec helper acc v =
  if v = 0 then 0 :: acc else helper ((v mod 10) :: acc) (v / 10);;

let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      let helper acc v =
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
(2,9)-(5,8)
(10,32)-(10,33)
(10,50)-(10,51)
(10,55)-(10,56)
(10,68)-(10,69)
*)

(* type error slice
(3,31)-(3,65)
(10,33)-(10,49)
*)
