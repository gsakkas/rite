
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> 0
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
(9,16)-(9,17)
[]
ListG []

(10,18)-(10,19)
[h]
ListG [VarG]

*)

(* type error slice
(3,3)-(10,20)
(4,11)-(4,13)
(6,7)-(10,20)
(9,16)-(9,17)
*)
