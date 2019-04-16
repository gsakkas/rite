
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
(3,9)-(3,19)
l
VarG

(4,11)-(4,12)
[]
ListG (fromList [])

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
(3,3)-(10,24)
(4,11)-(4,12)
(6,7)-(10,24)
(8,12)-(10,23)
(9,14)-(9,77)
(9,28)-(9,36)
(9,42)-(9,48)
(9,42)-(9,77)
(10,12)-(10,18)
(10,12)-(10,23)
*)
