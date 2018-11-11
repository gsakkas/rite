
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> [((mulByDigit i (List.rev t)) * 10) + (h * i)];;


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
(5,13)-(5,47)
let rec helper =
  fun acc ->
    fun v ->
      if v = 0
      then acc
      else helper ((v mod 10) :: acc)
                  (v / 10) in
helper [] h
LetG Rec [LamG EmptyG Nothing] (AppG EmptyG [EmptyG,EmptyG])

(5,14)-(5,41)
fun acc ->
  fun v ->
    if v = 0
    then acc
    else helper ((v mod 10) :: acc)
                (v / 10)
LamG (LamG EmptyG Nothing) Nothing

(5,14)-(5,41)
fun v ->
  if v = 0
  then acc
  else helper ((v mod 10) :: acc)
              (v / 10)
LamG (IteG EmptyG EmptyG EmptyG) Nothing

(5,14)-(5,41)
v = 0
BopG VarG LitG

(5,14)-(5,41)
if v = 0
then acc
else helper ((v mod 10) :: acc)
            (v / 10)
IteG (BopG EmptyG EmptyG) VarG (AppG EmptyG [EmptyG,EmptyG])

(5,44)-(5,46)
v mod 10
BopG VarG LitG

(5,51)-(5,52)
helper [] h
AppG VarG [ListG [] Nothing,VarG]

(5,51)-(5,52)
v / 10
BopG VarG LitG

*)
