
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
(10,18)-(10,19)
[h]
ListG [VarG]

*)

(* type error slice
(6,7)-(10,20)
(6,14)-(7,23)
(6,72)-(6,73)
(7,16)-(7,23)
(7,17)-(7,22)
(9,16)-(9,18)
(10,18)-(10,19)
*)
