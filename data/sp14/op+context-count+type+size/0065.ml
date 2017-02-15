
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
      (adder (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t)))) @
        [helper [] (h * i)];;


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
(38,6)-(38,71)
(38,7)-(38,12)
(39,8)-(39,27)
(39,9)-(39,15)
*)

(* type error slice
(2,34)-(2,35)
(2,34)-(2,56)
(2,34)-(2,56)
(2,39)-(2,56)
(2,40)-(2,45)
(2,46)-(2,47)
(4,3)-(7,79)
(4,12)-(7,77)
(4,15)-(7,77)
(6,21)-(6,68)
(6,22)-(6,27)
(6,28)-(6,29)
(7,12)-(7,76)
(7,13)-(7,24)
(7,25)-(7,72)
(7,26)-(7,31)
(7,73)-(7,75)
(12,3)-(29,36)
(12,11)-(29,34)
(12,14)-(29,34)
(29,18)-(29,33)
(29,19)-(29,26)
(29,30)-(29,32)
(36,8)-(36,66)
(36,8)-(36,66)
(36,22)-(36,25)
(36,31)-(36,37)
(36,31)-(36,66)
(36,38)-(36,57)
(36,53)-(36,56)
(37,58)-(37,64)
(37,58)-(37,76)
(37,67)-(37,76)
(37,68)-(37,73)
(38,6)-(38,71)
(38,6)-(39,27)
(38,7)-(38,12)
(38,72)-(38,73)
(39,8)-(39,27)
(39,8)-(39,27)
(39,9)-(39,15)
(39,9)-(39,26)
*)
