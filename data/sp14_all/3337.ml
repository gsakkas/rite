
let rec mulByDigit i l =
  match List.rev l with
  | [] -> false
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h1::t1 -> let rec helper acc v = [v] = [0] in helper [] h1);;


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

(4,11)-(4,16)
[]
ListG (fromList [])

(6,7)-(10,69)
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
(2,4)-(10,71)
(2,20)-(10,69)
(2,22)-(10,69)
(3,3)-(10,69)
(4,11)-(4,16)
(6,7)-(10,69)
(6,14)-(6,71)
(6,14)-(7,23)
(6,15)-(6,25)
(6,72)-(6,73)
(9,16)-(9,18)
(10,20)-(10,68)
(10,35)-(10,52)
(10,39)-(10,52)
(10,43)-(10,52)
(10,56)-(10,62)
(10,56)-(10,68)
*)
