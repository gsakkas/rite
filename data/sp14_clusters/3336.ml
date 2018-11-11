
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
(10,42)-(10,47)
if v = 0 then [1] else [0]
IteG (BopG EmptyG EmptyG) (ListG EmptyG Nothing) (ListG EmptyG Nothing)

(10,51)-(10,63)
1
LitG

(10,51)-(10,63)
0
LitG

(10,51)-(10,63)
[1]
ListG LitG Nothing

(10,51)-(10,63)
[0]
ListG LitG Nothing

*)
