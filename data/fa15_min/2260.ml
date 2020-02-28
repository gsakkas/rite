
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
    | (place,l) -> ((place * 10), (bigAdd (mulByDigit (place * l) l1) l)) in
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
    | (place,l) -> ((place * 10), (bigAdd (mulByDigit (place * digit) l1) l)) in
  let base = (1, []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(36,64)-(36,65)
digit
VarG

*)

(* type error slice
(4,4)-(11,20)
(4,13)-(11,18)
(4,16)-(11,18)
(7,13)-(7,40)
(7,35)-(7,36)
(7,37)-(7,39)
(16,4)-(28,37)
(16,12)-(28,35)
(16,15)-(28,35)
(28,19)-(28,34)
(28,20)-(28,27)
(28,31)-(28,33)
(34,3)-(38,76)
(34,9)-(36,74)
(35,5)-(36,74)
(35,11)-(35,12)
(36,35)-(36,73)
(36,36)-(36,42)
(36,55)-(36,66)
(36,64)-(36,65)
(36,71)-(36,72)
(37,3)-(38,76)
(37,14)-(37,21)
(37,18)-(37,20)
(38,43)-(38,57)
(38,43)-(38,69)
(38,58)-(38,59)
(38,60)-(38,64)
*)
