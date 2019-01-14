
let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
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
(7,31)-(7,50)
helper ((v mod 10) :: acc)
       (v / 10)
AppG (fromList [BopG EmptyG EmptyG,ConAppG (Just EmptyG) Nothing])

(7,39)-(7,49)
(v mod 10) :: acc
ConAppG (Just (TupleG (fromList [VarG,BopG VarG LitG]))) Nothing

*)
