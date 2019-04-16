
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
(10,43)-(10,48)
if v = 0 then [1] else [0]
IteG (BopG EmptyG EmptyG) (ListG (fromList [EmptyG])) (ListG (fromList [EmptyG]))

*)

(* type error slice
(6,7)-(10,65)
(9,16)-(9,18)
(10,20)-(10,64)
(10,35)-(10,48)
(10,39)-(10,48)
(10,43)-(10,48)
(10,52)-(10,58)
(10,52)-(10,64)
*)
