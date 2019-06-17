
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,num) = a in
      let (l1',l2') = x in
      let addit = (l1' + l2') + carry in
      ((addit / 10), ((addit mod 10) :: num)) in
    let base = (0, []) in
    let args = List.combine (List.rev ([0] @ l1)) (List.rev ([0] @ l2)) in
    let (car,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 0
  then 0
  else
    if i = 1
    then l
    else
      if (i mod 2) = 0
      then mulByDigit (i / 2) (bigAdd l l)
      else bigAdd l (mulByDigit (i - 1) l);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,num) = a in
      let (l1',l2') = x in
      let addit = (l1' + l2') + carry in
      ((addit / 10), ((addit mod 10) :: num)) in
    let base = (0, []) in
    let args = List.combine (List.rev ([0] @ l1)) (List.rev ([0] @ l2)) in
    let (car,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 0
  then []
  else
    if i = 1
    then l
    else
      if (i mod 2) = 0
      then mulByDigit (i / 2) (bigAdd l l)
      else bigAdd l (mulByDigit (i - 1) l);;

*)

(* changed spans
(25,8)-(25,9)
[]
ListG []

*)

(* type error slice
(9,3)-(9,69)
(9,9)-(9,10)
(9,36)-(9,69)
(9,50)-(9,60)
(9,50)-(9,62)
(9,68)-(9,69)
(11,4)-(21,37)
(11,12)-(21,35)
(11,15)-(21,35)
(12,3)-(21,35)
(21,3)-(21,13)
(21,3)-(21,35)
(24,3)-(32,43)
(25,8)-(25,9)
(27,5)-(32,43)
(30,7)-(32,43)
(32,12)-(32,18)
(32,12)-(32,43)
*)
