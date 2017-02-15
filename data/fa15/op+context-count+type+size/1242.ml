
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
(35,33)-(35,44)
(35,42)-(35,43)
(35,46)-(35,72)
(35,47)-(35,53)
(35,66)-(35,67)
(35,68)-(35,70)
(36,2)-(37,75)
(36,13)-(36,20)
(37,2)-(37,75)
(37,28)-(37,75)
*)

(* type error slice
(31,45)-(31,51)
(31,45)-(31,76)
(31,54)-(31,76)
(31,55)-(31,65)
(31,66)-(31,73)
(34,2)-(37,75)
(34,8)-(35,73)
(34,10)-(35,73)
(35,4)-(35,73)
(35,4)-(35,73)
(35,10)-(35,11)
(35,32)-(35,73)
(35,46)-(35,72)
(35,47)-(35,53)
(35,54)-(35,71)
(35,55)-(35,65)
(35,66)-(35,67)
(37,42)-(37,56)
(37,42)-(37,68)
(37,57)-(37,58)
*)
