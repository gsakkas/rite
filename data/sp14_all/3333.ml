
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h::t ->
           let rec helper acc v =
             if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
           helper h);;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h::t ->
           let rec helper acc v =
             if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
           helper [] h);;

*)

(* changed spans
(13,12)-(13,20)
helper [] h
AppG (fromList [VarG,ListG (fromList [])])

*)

(* type error slice
(6,7)-(13,21)
(6,14)-(7,23)
(6,72)-(6,73)
(7,16)-(7,23)
(7,17)-(7,22)
(9,16)-(9,18)
(11,12)-(13,20)
(12,37)-(12,43)
(12,37)-(12,72)
(12,44)-(12,63)
(13,12)-(13,18)
(13,12)-(13,20)
(13,19)-(13,20)
*)
