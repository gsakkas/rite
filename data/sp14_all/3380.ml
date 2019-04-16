
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let f a x = a + x in
      let base = 0 in
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      helper []
        [List.fold_left f base
           ((mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
              [h * i])];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let f a x = a + x in
      let base = 0 in
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      helper []
        (List.hd
           [List.fold_left f base
              ((mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
                 [h * i])]);;

*)

(* changed spans
(11,9)-(13,24)
List.hd [List.fold_left f base
                        (mulByDigit i
                                    (List.rev (List.map (fun x ->
                                                           x * 10)
                                                        t)) @ [h * i])]
AppG (fromList [ListG (fromList [EmptyG])])

*)

(* type error slice
(9,32)-(9,38)
(9,32)-(9,67)
(9,59)-(9,67)
(10,7)-(10,13)
(10,7)-(13,24)
(11,9)-(13,24)
*)
