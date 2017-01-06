
let rec mulByDigit i l =
  match List.rev l with
  | [] -> 0
  | h::t ->
      (match ((mulByDigit i (List.rev t)) * 10) + (h * i) with
       | n ->
           let rec helper acc v =
             if v = 0 then 0 :: acc else helper ((v mod 10) :: acc) (v / 10) in
           helper [] n);;



let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      helper [] h;;


(* changed spans
(3,9)-(3,17)
(4,11)-(4,12)
(6,7)-(7,14)
(9,28)-(9,32)
(10,22)-(10,24)
*)

(* type error slice
(3,9)-(3,19)
*)
