
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (v1,v2) ->
          (match a with
           | (list1,list2) ->
               (match list1 with
                | [] ->
                    ((((v1 + v2) / 10) :: list1), (((v1 + v2) mod 10) ::
                      list2))
                | h::t ->
                    (((((v1 + v2) + h) / 10) :: list1),
                      ((((v1 + v2) + h) mod 10) :: list2)))) in
    let base = ([], []) in
    let args = List.append (List.rev (List.combine l1 l2)) [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> [0]
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      let rec adder x = match x with | [] -> [0] | h::t -> bigAdd h (adder t) in
      adder
        ((mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
           ((helper [] (h * i)) @ []));;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (v1,v2) ->
          (match a with
           | (list1,list2) ->
               (match list1 with
                | [] ->
                    ((((v1 + v2) / 10) :: list1), (((v1 + v2) mod 10) ::
                      list2))
                | h::t ->
                    (((((v1 + v2) + h) / 10) :: list1),
                      ((((v1 + v2) + h) mod 10) :: list2)))) in
    let base = ([], []) in
    let args = List.append (List.rev (List.combine l1 l2)) [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      let rec adder x = match x with | [] -> [] | h::t -> bigAdd h (adder t) in
      (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
        ((helper [] (h * i)) @ []);;

*)

(* changed spans
(33,10)-(33,13)
(33,11)-(33,12)
(37,45)-(37,48)
(37,46)-(37,47)
(38,6)-(38,11)
(38,6)-(40,38)
(40,24)-(40,25)
*)

(* type error slice
(4,3)-(7,79)
(4,12)-(7,77)
(6,50)-(6,66)
(6,51)-(6,62)
(6,63)-(6,65)
(12,3)-(29,36)
(12,11)-(29,34)
(29,18)-(29,33)
(29,19)-(29,26)
(29,27)-(29,29)
(36,8)-(36,66)
(36,8)-(36,66)
(36,22)-(36,25)
(36,31)-(36,37)
(36,31)-(36,66)
(36,38)-(36,57)
(36,38)-(36,57)
(36,39)-(36,49)
(36,53)-(36,56)
(37,24)-(37,77)
(37,24)-(37,77)
(37,59)-(37,65)
(37,59)-(37,77)
(37,66)-(37,67)
(37,68)-(37,77)
(37,69)-(37,74)
(37,75)-(37,76)
(38,6)-(38,11)
(38,6)-(40,38)
(39,8)-(40,38)
(39,67)-(39,68)
(40,11)-(40,37)
(40,12)-(40,31)
(40,13)-(40,19)
(40,32)-(40,33)
*)
