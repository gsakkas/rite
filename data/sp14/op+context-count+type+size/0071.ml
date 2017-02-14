
let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [helper [] (h * i)]
       with
       | [] -> []
       | h::t -> h);;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
        ((helper [] (h * i)) @ []);;

*)

(* changed spans
(8,6)-(12,19)
(9,15)-(9,34)
(9,16)-(9,22)
(12,17)-(12,18)
*)

(* type error slice
(2,3)-(12,21)
(2,19)-(12,19)
(2,21)-(12,19)
(3,2)-(12,19)
(6,6)-(12,19)
(8,6)-(12,19)
(8,6)-(12,19)
(8,6)-(12,19)
(8,13)-(8,70)
(8,13)-(9,34)
(8,14)-(8,24)
(8,71)-(8,72)
(12,17)-(12,18)
*)
