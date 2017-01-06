
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h::t -> let rec helper v = [(helper v) / 10; h1 mod 10] in helper h);;



let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h::t ->
           let rec helper v = (helper (v / 10)) @ [v mod 10] in helper h);;


(* changed spans
(10,37)-(10,38)
(10,47)-(10,48)
(10,53)-(10,57)
*)

(* type error slice
*)
