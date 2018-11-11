
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
(9,6)-(11,17)
let rec helper =
  fun acc ->
    fun v ->
      if v = 0
      then acc
      else helper ((v mod 10) :: acc)
                  (v / 10) in
helper [] h
LetG Rec [LamG EmptyG] (AppG [EmptyG,EmptyG])

(10,31)-(10,50)
helper ((v mod 10) :: acc)
       (v / 10)
AppG [ConAppG (Just EmptyG) Nothing,BopG EmptyG EmptyG]

(10,39)-(10,49)
(v mod 10) :: acc
ConAppG (Just (TupleG [BopG VarG LitG,VarG])) Nothing

*)
