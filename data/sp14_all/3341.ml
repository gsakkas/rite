
let x a = a;;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match [((mulByDigit i (List.rev t)) * 10) + (h * i)] with
       | x::y ->
           let rec helper acc v =
             if v = 0 then 0 :: acc else helper ((v mod 10) :: acc) (v / 10) in
           helper [] x);;


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
(5,9)-(5,19)
l
VarG

(8,7)-(12,24)
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
(4,4)-(12,26)
(4,20)-(12,24)
(4,22)-(12,24)
(5,3)-(12,24)
(8,7)-(12,24)
(8,15)-(8,49)
(8,16)-(8,43)
(8,17)-(8,27)
(10,12)-(12,23)
(11,14)-(11,77)
(11,28)-(11,36)
(11,42)-(11,48)
(11,42)-(11,77)
(12,12)-(12,18)
(12,12)-(12,23)
*)
