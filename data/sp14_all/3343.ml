
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> ((mulByDigit i (List.rev t)) * 10) + (h * i);;


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
(3,9)-(3,19)
l
VarG

(5,13)-(5,57)
let rec helper =
  fun acc ->
    fun v ->
      if v = 0
      then acc
      else helper ((v mod 10) :: acc)
                  (v / 10) in
helper [] h
LetG Rec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (AppG (fromList [EmptyG]))

*)

(* type error slice
(2,4)-(5,59)
(2,20)-(5,57)
(2,22)-(5,57)
(3,3)-(5,57)
(4,11)-(4,13)
(5,13)-(5,47)
(5,13)-(5,57)
(5,14)-(5,41)
(5,15)-(5,25)
*)
