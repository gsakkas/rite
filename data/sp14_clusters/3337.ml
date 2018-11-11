
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
(10,42)-(10,51)
if v = 0
then acc
else helper ((v mod 10) :: acc)
            (v / 10)
IteG (BopG EmptyG EmptyG) VarG (AppG [EmptyG,EmptyG])

(10,55)-(10,67)
acc
VarG

(10,62)-(10,64)
v
VarG

(10,62)-(10,64)
acc
VarG

(10,62)-(10,64)
v
VarG

(10,62)-(10,64)
helper
VarG

(10,62)-(10,64)
helper [] h
AppG [ListG EmptyG Nothing,VarG]

(10,62)-(10,64)
v mod 10
BopG VarG LitG

(10,62)-(10,64)
v / 10
BopG VarG LitG

(10,62)-(10,64)
10
LitG

(10,62)-(10,64)
10
LitG

(10,62)-(10,64)
(v mod 10) :: acc
ConAppG (Just (TupleG [BopG VarG LitG,VarG])) Nothing

(10,65)-(10,67)
h
VarG

*)
