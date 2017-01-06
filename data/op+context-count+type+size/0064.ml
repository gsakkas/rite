
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h::t ->
           let rec helper v = ((helper v) / 10) @ [h1 mod 10] in helper h);;



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
(11,32)-(11,33)
(11,41)-(11,42)
(11,52)-(11,54)
*)

(* type error slice
*)
