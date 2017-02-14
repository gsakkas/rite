
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h::t ->
           let f a x = a + x in
           let base = 0 in List.fold_left f base (h :: t));;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h::t ->
           let f a x = a + x in
           let base = 0 in [List.fold_left f base (h :: t)]);;

*)

(* changed spans
(12,27)-(12,57)
*)

(* type error slice
(6,6)-(12,58)
(6,6)-(12,58)
(9,15)-(9,17)
(11,11)-(12,57)
(11,11)-(12,57)
(11,17)-(11,28)
(11,23)-(11,24)
(11,23)-(11,28)
(12,11)-(12,57)
(12,27)-(12,41)
(12,27)-(12,57)
(12,42)-(12,43)
*)
