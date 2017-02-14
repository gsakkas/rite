
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
(12,28)-(12,57)
*)

(* type error slice
(6,8)-(12,57)
(6,8)-(12,57)
(9,16)-(9,18)
(11,12)-(12,57)
(11,12)-(12,57)
(11,18)-(11,29)
(11,24)-(11,25)
(11,24)-(11,29)
(12,12)-(12,57)
(12,28)-(12,42)
(12,28)-(12,57)
(12,43)-(12,44)
*)
