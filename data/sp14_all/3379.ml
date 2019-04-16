
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let f a x = a + x in
      let base = 0 in
      let rec helper acc v =
        if v = 0 then acc else (helper (v mod 10)) :: (acc (v / 10)) in
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
(9,32)-(9,69)
helper ((v mod 10) :: acc)
       (v / 10)
AppG (fromList [BopG EmptyG EmptyG,ConAppG (Just EmptyG)])

(11,9)-(13,24)
List.hd [List.fold_left f base
                        (mulByDigit i
                                    (List.rev (List.map (fun x ->
                                                           x * 10)
                                                        t)) @ [h * i])]
AppG (fromList [ListG (fromList [EmptyG])])

*)

(* type error slice
(9,9)-(9,69)
(9,23)-(9,26)
(9,32)-(9,51)
(9,32)-(9,69)
(9,33)-(9,39)
(9,40)-(9,50)
(9,55)-(9,69)
(9,56)-(9,59)
(10,7)-(10,13)
(10,7)-(13,24)
(10,14)-(10,16)
*)
