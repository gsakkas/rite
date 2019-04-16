
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
(6,3)-(14,24)
if i = 0
then [0]
else bigAdd l l
IteG (BopG EmptyG EmptyG) (ListG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* type error slice
(6,3)-(14,24)
(6,13)-(13,68)
(7,5)-(13,68)
(7,11)-(11,74)
(8,7)-(11,74)
(8,13)-(8,14)
(11,33)-(11,44)
(11,42)-(11,43)
(12,5)-(13,68)
(13,5)-(13,68)
(13,21)-(13,68)
(13,35)-(13,49)
(13,35)-(13,61)
(13,50)-(13,51)
(13,65)-(13,68)
(14,14)-(14,24)
(14,15)-(14,19)
*)
