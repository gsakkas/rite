
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
  if i = 0 then [0] else if i = 1 then l else bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x = match a with | (o,l) -> bigAdd (mulByDigit o l1) a in
  let base = (1, []) in
  let args = l2 in let (_,res) = List.fold_left f base args in res;;


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
  if i = 0 then [0] else if i = 1 then l else bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    match a with | (o,l) -> ((10 * o), (bigAdd (mulByDigit o l1) l)) in
  let base = (1, []) in
  let args = l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(34,38)-(34,64)
(34,63)-(34,64)
(35,2)-(36,66)
(35,13)-(35,20)
(36,2)-(36,66)
(36,19)-(36,66)
*)

(* type error slice
(4,3)-(11,19)
(4,12)-(11,17)
(4,15)-(11,17)
(7,12)-(7,39)
(7,34)-(7,35)
(7,36)-(7,38)
(14,35)-(14,73)
(14,35)-(14,73)
(14,49)-(14,59)
(14,49)-(14,61)
(14,67)-(14,73)
(16,3)-(28,36)
(16,11)-(28,34)
(16,14)-(28,34)
(17,2)-(28,34)
(28,2)-(28,12)
(28,2)-(28,34)
(28,18)-(28,33)
(28,19)-(28,26)
(28,30)-(28,32)
(34,2)-(36,66)
(34,8)-(34,64)
(34,10)-(34,64)
(34,14)-(34,64)
(34,14)-(34,64)
(34,20)-(34,21)
(34,38)-(34,44)
(34,38)-(34,64)
(34,63)-(34,64)
(35,2)-(36,66)
(35,13)-(35,20)
(36,33)-(36,47)
(36,33)-(36,59)
(36,48)-(36,49)
(36,50)-(36,54)
*)
