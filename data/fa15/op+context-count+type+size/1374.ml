
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference = (List.length l1) - (List.length l2) in
  if difference > 0
  then (l1, ((clone 0 difference) @ l2))
  else
    if difference < 0
    then (((clone 0 ((-1) * difference)) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (o,l) ->
          let sum = x + o in
          if sum < 10 then (0, (sum :: l)) else (1, ((sum - 10) :: l)) in
    let base = (0, []) in
    let args =
      let combine (a,b) = a + b in
      (List.map combine (List.rev (List.combine l1 l2))) @ [0] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 0 then [] else if i = 1 then l else bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a digit =
    match a with | (place,l) -> ((place + 1), (bigAdd (mulByDigit l l1))) in
  let base = (1, []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference = (List.length l1) - (List.length l2) in
  if difference > 0
  then (l1, ((clone 0 difference) @ l2))
  else
    if difference < 0
    then (((clone 0 ((-1) * difference)) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (o,l) ->
          let sum = x + o in
          if sum < 10 then (0, (sum :: l)) else (1, ((sum - 10) :: l)) in
    let base = (0, []) in
    let args =
      let combine (a,b) = a + b in
      (List.map combine (List.rev (List.combine l1 l2))) @ [0] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 0 then [] else if i = 1 then l else bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a digit =
    match a with
    | (place,l) -> ((place * 10), (bigAdd (mulByDigit (place * 10) l1) l)) in
  let base = (1, []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(35,35)-(35,44)
(35,43)-(35,44)
(35,48)-(35,54)
(35,48)-(35,71)
(35,67)-(35,68)
(35,69)-(35,71)
(36,3)-(37,76)
(36,15)-(36,20)
(37,3)-(37,76)
(37,29)-(37,76)
*)

(* type error slice
(31,46)-(31,52)
(31,46)-(31,76)
(31,56)-(31,66)
(31,56)-(31,76)
(31,68)-(31,73)
(34,3)-(37,76)
(34,9)-(35,71)
(34,11)-(35,71)
(35,5)-(35,71)
(35,5)-(35,71)
(35,11)-(35,12)
(35,35)-(35,71)
(35,48)-(35,54)
(35,48)-(35,71)
(35,56)-(35,66)
(35,56)-(35,71)
(35,67)-(35,68)
(37,43)-(37,57)
(37,43)-(37,69)
(37,58)-(37,59)
*)
