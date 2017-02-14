
let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h::t ->
           let rec helper acc v = if v = 0 then acc else v mod 10 in
           helper [] h);;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h::t ->
           let rec helper acc v = if v = 0 then acc else [v mod 10] in
           helper [] h);;

*)

(* changed spans
(11,57)-(11,65)
*)

(* type error slice
(11,11)-(12,22)
(11,26)-(11,65)
(11,34)-(11,65)
(11,34)-(11,65)
(11,48)-(11,51)
(11,57)-(11,65)
(12,11)-(12,17)
(12,11)-(12,22)
(12,18)-(12,20)
*)
