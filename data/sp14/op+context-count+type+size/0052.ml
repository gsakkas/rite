
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
(13,11)-(13,19)
(13,18)-(13,19)
*)

(* type error slice
(6,6)-(13,20)
(6,6)-(13,20)
(6,6)-(13,20)
(6,6)-(13,20)
(6,13)-(7,22)
(6,71)-(6,72)
(7,15)-(7,22)
(7,15)-(7,22)
(7,16)-(7,21)
(9,15)-(9,17)
(11,11)-(13,19)
(12,36)-(12,42)
(12,36)-(12,71)
(12,43)-(12,62)
(13,11)-(13,17)
(13,11)-(13,19)
(13,18)-(13,19)
*)
