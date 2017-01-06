
let x a = a;;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match [((mulByDigit i (List.rev t)) * 10) + (h * i)] with
       | x::y ->
           let rec helper acc v =
             if v = 0 then 0 :: acc else helper ((v mod 10) :: acc) (v / 10) in
           helper [] x);;



let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      helper [] h;;


(* changed spans
(2,5)-(4,4)
(5,9)-(5,17)
(8,7)-(9,17)
(11,28)-(11,32)
(12,22)-(12,24)
*)

(* type error slice
(5,9)-(5,19)
*)
