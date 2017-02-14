
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h::t -> h);;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h::t -> [h]);;

*)

(* changed spans
(10,17)-(10,18)
*)

(* type error slice
(6,6)-(10,19)
(6,6)-(10,19)
(6,6)-(10,19)
(6,6)-(10,19)
(6,13)-(7,22)
(6,71)-(6,72)
(7,15)-(7,22)
(7,15)-(7,22)
(7,16)-(7,21)
(9,15)-(9,17)
(10,17)-(10,18)
*)
