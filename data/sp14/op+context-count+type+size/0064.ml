
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h1::t1 -> let rec helper acc v = v = 0 in helper [] h1);;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h1::t1 ->
           let rec helper acc v = if v = 0 then [1] else [0] in helper [] h1);;

*)

(* changed spans
(10,19)-(10,63)
(10,42)-(10,47)
(10,51)-(10,57)
(10,51)-(10,63)
(10,58)-(10,60)
(10,61)-(10,63)
*)

(* type error slice
(6,6)-(10,64)
(6,6)-(10,64)
(9,15)-(9,17)
(10,19)-(10,63)
(10,19)-(10,63)
(10,34)-(10,47)
(10,38)-(10,47)
(10,42)-(10,47)
(10,51)-(10,57)
(10,51)-(10,63)
*)
