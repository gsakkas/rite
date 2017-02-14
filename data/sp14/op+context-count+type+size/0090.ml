
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
           helper []);;


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
(13,11)-(13,20)
*)

(* type error slice
(6,6)-(13,21)
(6,6)-(13,21)
(9,15)-(9,17)
(11,11)-(13,20)
(12,36)-(12,42)
(12,36)-(12,71)
(13,11)-(13,17)
(13,11)-(13,20)
*)
