
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
    match a with
    | (o,l) ->
        let prod = mulByDigit x l in
        if prod < 10
        then (0, (prod :: l))
        else ((prod / 10), ((prod mod 10) :: l)) in
  let base = (0, []) in
  let args =
    let combine (a,b) = a + b in
    (List.map combine (List.rev (List.combine l1 l2))) @ [0] in
  let (_,res) = List.fold_left f base args in res;;


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
(37,8)-(40,48)
(37,19)-(37,29)
(37,19)-(37,33)
(37,30)-(37,31)
(37,32)-(37,33)
(38,8)-(40,48)
(38,11)-(38,15)
(38,11)-(38,20)
(38,18)-(38,20)
(39,14)-(39,15)
(39,17)-(39,28)
(39,18)-(39,22)
(39,26)-(39,27)
(40,13)-(40,48)
(40,14)-(40,25)
(40,15)-(40,19)
(40,22)-(40,24)
(40,27)-(40,47)
(40,28)-(40,41)
(40,29)-(40,33)
(40,45)-(40,46)
(41,2)-(45,49)
(42,2)-(45,49)
*)

(* type error slice
(4,3)-(11,19)
(4,12)-(11,17)
(4,15)-(11,17)
(7,12)-(7,39)
(7,13)-(7,33)
(7,14)-(7,19)
(7,34)-(7,35)
(7,36)-(7,38)
(10,10)-(10,46)
(10,11)-(10,40)
(10,12)-(10,17)
(10,41)-(10,42)
(10,43)-(10,45)
(16,3)-(28,36)
(16,11)-(28,34)
(16,14)-(28,34)
(28,18)-(28,33)
(28,19)-(28,26)
(28,27)-(28,29)
(28,30)-(28,32)
(31,46)-(31,52)
(31,46)-(31,77)
(31,53)-(31,54)
(31,55)-(31,77)
(31,56)-(31,66)
(31,75)-(31,76)
(37,8)-(40,48)
(37,19)-(37,29)
(37,19)-(37,33)
(37,32)-(37,33)
(38,8)-(40,48)
(38,8)-(40,48)
(38,11)-(38,15)
(38,11)-(38,20)
(38,11)-(38,20)
(38,18)-(38,20)
(39,13)-(39,29)
(39,17)-(39,28)
(39,17)-(39,28)
(39,17)-(39,28)
(39,18)-(39,22)
(39,26)-(39,27)
(40,13)-(40,48)
(40,14)-(40,25)
(40,15)-(40,19)
(40,27)-(40,47)
(40,27)-(40,47)
(40,28)-(40,41)
(40,28)-(40,41)
(40,29)-(40,33)
*)
