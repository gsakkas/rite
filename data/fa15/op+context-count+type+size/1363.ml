
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
        let prod = (mulByDigit l x) + o in
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
(37,9)-(40,47)
(37,21)-(37,31)
(37,21)-(37,35)
(37,21)-(37,40)
(37,32)-(37,33)
(37,34)-(37,35)
(38,9)-(40,47)
(38,12)-(38,16)
(38,12)-(38,21)
(38,19)-(38,21)
(39,15)-(39,16)
(39,15)-(39,28)
(39,19)-(39,23)
(39,19)-(39,28)
(40,16)-(40,20)
(40,16)-(40,25)
(40,16)-(40,47)
(40,23)-(40,25)
(40,30)-(40,34)
(40,30)-(40,41)
(40,30)-(40,47)
(40,39)-(40,41)
(40,46)-(40,47)
(41,3)-(45,50)
*)

(* type error slice
(4,4)-(11,20)
(4,13)-(11,17)
(4,16)-(11,17)
(7,15)-(7,39)
(7,35)-(7,36)
(7,37)-(7,39)
(16,4)-(28,37)
(16,12)-(28,33)
(16,15)-(28,33)
(28,20)-(28,27)
(28,20)-(28,33)
(28,31)-(28,33)
(31,47)-(31,53)
(31,47)-(31,77)
(31,57)-(31,67)
(31,57)-(31,77)
(31,69)-(31,74)
(34,3)-(45,50)
(34,9)-(40,47)
(34,11)-(40,47)
(35,5)-(40,47)
(35,5)-(40,47)
(35,11)-(35,12)
(37,9)-(40,47)
(37,21)-(37,31)
(37,21)-(37,35)
(37,21)-(37,40)
(37,32)-(37,33)
(38,9)-(40,47)
(39,15)-(39,28)
(39,19)-(39,28)
(39,19)-(39,28)
(39,27)-(39,28)
(40,30)-(40,47)
(40,46)-(40,47)
(45,17)-(45,31)
(45,17)-(45,43)
(45,32)-(45,33)
*)
