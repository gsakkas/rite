
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
(8,8)-(12,19)
(9,16)-(9,35)
(9,17)-(9,23)
(12,18)-(12,19)
*)

(* type error slice
(2,4)-(12,22)
(2,20)-(12,19)
(2,22)-(12,19)
(3,3)-(12,19)
(6,7)-(12,19)
(8,8)-(12,19)
(8,8)-(12,19)
(8,8)-(12,19)
(8,15)-(8,25)
(8,15)-(8,68)
(8,15)-(9,35)
(8,72)-(8,73)
(12,18)-(12,19)
*)
