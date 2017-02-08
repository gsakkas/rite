
let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h::t -> h);;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h::t -> [h]);;

*)

(* changed spans
(10,18)-(10,19)
*)

(* type error slice
(6,8)-(10,19)
(6,8)-(10,19)
(6,8)-(10,19)
(6,8)-(10,19)
(6,15)-(7,23)
(6,72)-(6,73)
(7,16)-(7,23)
(7,16)-(7,23)
(7,17)-(7,22)
(9,16)-(9,18)
(10,18)-(10,19)
*)
