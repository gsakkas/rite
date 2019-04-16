
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
(3,9)-(3,19)
l
VarG

(6,7)-(10,24)
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
(2,4)-(10,26)
(2,20)-(10,24)
(2,22)-(10,24)
(3,3)-(10,24)
(6,7)-(10,24)
(6,14)-(6,48)
(6,15)-(6,42)
(6,16)-(6,26)
(8,12)-(10,23)
(9,14)-(9,77)
(9,28)-(9,36)
(9,42)-(9,48)
(9,42)-(9,77)
(10,12)-(10,18)
(10,12)-(10,23)
*)
