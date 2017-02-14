
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
(9,15)-(9,16)
(10,17)-(10,18)
*)

(* type error slice
(3,2)-(10,19)
(3,2)-(10,19)
(4,10)-(4,12)
(6,6)-(10,19)
(9,15)-(9,16)
*)
