
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
        let prod = (mulByDigit (x l)) + o in
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
(37,19)-(37,37)
(37,19)-(37,41)
(37,20)-(37,30)
(37,31)-(37,36)
(37,32)-(37,33)
(37,34)-(37,35)
(38,8)-(40,48)
(38,11)-(38,15)
(38,11)-(38,20)
(38,18)-(38,20)
(39,13)-(39,29)
(39,14)-(39,15)
(39,17)-(39,28)
(39,18)-(39,22)
(40,13)-(40,48)
(40,14)-(40,25)
(40,15)-(40,19)
(40,22)-(40,24)
(40,27)-(40,47)
(40,28)-(40,41)
(40,29)-(40,33)
(40,38)-(40,40)
(40,45)-(40,46)
(41,2)-(45,49)
(41,13)-(41,20)
*)

(* type error slice
(31,55)-(31,77)
(31,56)-(31,66)
(34,2)-(45,49)
(34,8)-(40,48)
(34,10)-(40,48)
(37,19)-(37,37)
(37,19)-(37,41)
(37,20)-(37,30)
(37,31)-(37,36)
(37,32)-(37,33)
(42,2)-(45,49)
(43,4)-(44,60)
(43,4)-(44,60)
(43,17)-(43,29)
(43,24)-(43,29)
(44,4)-(44,54)
(44,4)-(44,60)
(44,5)-(44,13)
(44,14)-(44,21)
(44,55)-(44,56)
(45,16)-(45,30)
(45,16)-(45,42)
(45,31)-(45,32)
(45,38)-(45,42)
*)
