
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
(9,31)-(9,50)
(9,31)-(9,68)
(9,39)-(9,49)
(9,54)-(9,68)
(11,8)-(13,23)
*)

(* type error slice
(8,6)-(13,23)
(8,21)-(9,68)
(9,8)-(9,68)
(9,8)-(9,68)
(9,22)-(9,25)
(9,31)-(9,50)
(9,31)-(9,68)
(9,32)-(9,38)
(9,39)-(9,49)
(9,54)-(9,68)
(9,55)-(9,58)
(10,6)-(10,12)
(10,6)-(13,23)
(10,13)-(10,15)
*)
