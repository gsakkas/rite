
let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h::t -> h);;



let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h::t -> [h]);;


(* changed spans
*)

(* type error slice
(6,39)-(6,68)
*)
