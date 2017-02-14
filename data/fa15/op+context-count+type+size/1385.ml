
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
  if i >= 0 then bigAdd l l else (mulByDigit i) - (1 l);;


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
  if i >= 0 then List.rev (mulByDigit (i - 1) l) else bigAdd l l;;

*)

(* changed spans
(31,18)-(31,24)
(31,18)-(31,28)
(31,25)-(31,26)
(31,27)-(31,28)
(31,35)-(31,45)
(31,35)-(31,55)
(31,46)-(31,47)
(31,52)-(31,55)
*)

(* type error slice
(14,36)-(14,74)
(14,36)-(14,74)
(14,50)-(14,60)
(14,50)-(14,62)
(14,68)-(14,74)
(16,4)-(28,37)
(16,12)-(28,33)
(16,15)-(28,33)
(17,3)-(28,33)
(28,3)-(28,13)
(28,3)-(28,33)
(30,4)-(31,58)
(30,20)-(31,55)
(30,22)-(31,55)
(31,3)-(31,55)
(31,3)-(31,55)
(31,18)-(31,24)
(31,18)-(31,28)
(31,35)-(31,45)
(31,35)-(31,47)
(31,35)-(31,55)
(31,35)-(31,55)
(31,52)-(31,53)
(31,52)-(31,55)
*)
