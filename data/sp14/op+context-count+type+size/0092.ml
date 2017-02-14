
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
           let base = 0 in
           (match [List.fold_left f base (h :: t)] with
            | [] -> []
            | a::b ->
                let rec helper acc v =
                  if v = 0
                  then acc
                  else ((v / 10) mod 10) :: ((v mod 10) :: acc) :: acc in
                helper [] a));;


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
           let base = 0 in
           (match [List.fold_left f base (h :: t)] with
            | [] -> []
            | a::b ->
                let rec helper acc v =
                  if v = 0
                  then acc
                  else ((v / 10) mod 10) :: (v mod 10) :: acc in
                helper [] a));;

*)

(* changed spans
(19,44)-(19,63)
(19,67)-(19,70)
*)

(* type error slice
(19,44)-(19,63)
(19,44)-(19,63)
(19,44)-(19,70)
(19,44)-(19,70)
(19,59)-(19,62)
(19,67)-(19,70)
*)
