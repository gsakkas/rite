
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
(9,33)-(9,49)
(9,33)-(9,67)
(9,41)-(9,49)
(9,56)-(9,67)
(11,9)-(13,24)
*)

(* type error slice
(6,7)-(13,24)
(6,13)-(6,24)
(6,15)-(6,24)
(6,19)-(6,20)
(6,19)-(6,24)
(6,23)-(6,24)
(7,7)-(13,24)
(7,18)-(7,19)
(8,7)-(13,24)
(8,22)-(9,67)
(8,26)-(9,67)
(9,9)-(9,67)
(9,12)-(9,13)
(9,12)-(9,17)
(9,16)-(9,17)
(9,23)-(9,26)
(9,33)-(9,39)
(9,33)-(9,49)
(9,33)-(9,67)
(9,41)-(9,49)
(9,56)-(9,59)
(9,56)-(9,67)
(9,61)-(9,67)
(10,7)-(10,13)
(10,7)-(13,24)
(10,14)-(10,16)
(11,9)-(13,24)
(11,10)-(11,24)
(11,10)-(13,22)
(11,25)-(11,26)
(11,27)-(11,31)
(12,14)-(13,22)
(12,71)-(12,72)
(13,15)-(13,22)
(13,16)-(13,21)
*)
