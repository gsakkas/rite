
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
(7,32)-(7,69)
helper ((v mod 10) :: acc)
       (v / 10)
AppG (fromList [BopG EmptyG EmptyG,ConAppG (Just EmptyG)])

*)

(* type error slice
(7,9)-(7,69)
(7,23)-(7,26)
(7,32)-(7,51)
(7,32)-(7,69)
(7,33)-(7,39)
(7,40)-(7,50)
(7,55)-(7,69)
(7,56)-(7,59)
(8,7)-(8,13)
(8,7)-(8,18)
(8,14)-(8,16)
*)
