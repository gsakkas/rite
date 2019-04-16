
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
(11,58)-(11,66)
[v mod 10]
ListG (fromList [BopG EmptyG EmptyG])

*)

(* type error slice
(11,12)-(12,23)
(11,27)-(11,66)
(11,35)-(11,66)
(11,49)-(11,52)
(11,58)-(11,66)
(12,12)-(12,18)
(12,12)-(12,23)
(12,19)-(12,21)
*)
