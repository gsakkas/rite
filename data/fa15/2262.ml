
let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else h :: t;;

let rec mulByDigit i l =
  let mult (i,l) =
    let f a x =
      match a with
      | (o,l) ->
          let prod = x + o in
          if prod < 10 then (0, (prod :: l)) else (1, ((prod - 10) :: l)) in
    let base = (0, []) in
    let args = l in let (_,res) = List.fold_left f base args in res in
  removeZero (mult i l);;


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

let rec mulByDigit i l = if i = 0 then [0] else bigAdd l l;;

*)

(* changed spans
(2,19)-(3,73)
(5,19)-(14,23)
(5,21)-(14,23)
(6,2)-(14,23)
(6,12)-(13,67)
(7,4)-(13,67)
(10,10)-(11,73)
(11,13)-(11,17)
(11,33)-(11,37)
(11,56)-(11,60)
(13,15)-(13,16)
(13,20)-(13,67)
(14,13)-(14,23)
(14,14)-(14,18)
(14,19)-(14,20)
(14,21)-(14,22)
*)

(* type error slice
(6,2)-(14,23)
(6,12)-(13,67)
(7,4)-(13,67)
(7,4)-(13,67)
(7,10)-(11,73)
(8,6)-(11,73)
(8,12)-(8,13)
(11,32)-(11,43)
(11,41)-(11,42)
(12,4)-(13,67)
(13,4)-(13,67)
(13,20)-(13,67)
(13,20)-(13,67)
(13,34)-(13,48)
(13,34)-(13,60)
(13,49)-(13,50)
(13,64)-(13,67)
(14,13)-(14,23)
(14,14)-(14,18)
*)

(* all spans
(2,19)-(3,73)
(3,2)-(3,73)
(3,8)-(3,9)
(3,23)-(3,24)
(3,35)-(3,73)
(3,38)-(3,43)
(3,38)-(3,39)
(3,42)-(3,43)
(3,49)-(3,61)
(3,49)-(3,59)
(3,60)-(3,61)
(3,67)-(3,73)
(3,67)-(3,68)
(3,72)-(3,73)
(5,19)-(14,23)
(5,21)-(14,23)
(6,2)-(14,23)
(6,12)-(13,67)
(7,4)-(13,67)
(7,10)-(11,73)
(7,12)-(11,73)
(8,6)-(11,73)
(8,12)-(8,13)
(10,10)-(11,73)
(10,21)-(10,26)
(10,21)-(10,22)
(10,25)-(10,26)
(11,10)-(11,73)
(11,13)-(11,22)
(11,13)-(11,17)
(11,20)-(11,22)
(11,28)-(11,44)
(11,29)-(11,30)
(11,32)-(11,43)
(11,33)-(11,37)
(11,41)-(11,42)
(11,50)-(11,73)
(11,51)-(11,52)
(11,54)-(11,72)
(11,55)-(11,66)
(11,56)-(11,60)
(11,63)-(11,65)
(11,70)-(11,71)
(12,4)-(13,67)
(12,15)-(12,22)
(12,16)-(12,17)
(12,19)-(12,21)
(13,4)-(13,67)
(13,15)-(13,16)
(13,20)-(13,67)
(13,34)-(13,60)
(13,34)-(13,48)
(13,49)-(13,50)
(13,51)-(13,55)
(13,56)-(13,60)
(13,64)-(13,67)
(14,2)-(14,23)
(14,2)-(14,12)
(14,13)-(14,23)
(14,14)-(14,18)
(14,19)-(14,20)
(14,21)-(14,22)
*)
