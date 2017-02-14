
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
          if o = 0
          then (if x < 10 then (0, (x :: l)) else (1, ((x mod 10) :: l)))
          else
            if o = 1
            then
              (if (x + 1) < 10
               then (0, (x :: l))
               else (1, (((x + 1) mod 10) :: l))) in
    let base = (0, []) in
    let args =
      let combine (a,b) = a + b in
      List.map combine (List.rev (List.combine l1 l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


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
          let sum = o + x in
          if sum < 10 then (0, (x :: l)) else (1, ((x mod 10) :: l)) in
    let base = (0, []) in
    let args =
      let combine (a,b) = a + b in
      List.map combine (List.rev (List.combine l1 l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(21,11)-(28,47)
(21,14)-(21,15)
(21,14)-(21,19)
(21,18)-(21,19)
(22,17)-(22,71)
(22,20)-(22,26)
(22,24)-(22,26)
(22,33)-(22,34)
(22,33)-(22,43)
(22,37)-(22,38)
(22,37)-(22,43)
(22,42)-(22,43)
(22,52)-(22,53)
(22,52)-(22,71)
(22,57)-(22,58)
(22,57)-(22,65)
(22,57)-(22,71)
(22,63)-(22,65)
(22,70)-(22,71)
(24,13)-(28,47)
(24,16)-(24,17)
(24,16)-(24,21)
(24,20)-(24,21)
(26,16)-(28,47)
(26,20)-(26,21)
(26,20)-(26,25)
(26,24)-(26,25)
(28,28)-(28,33)
(28,32)-(28,33)
(29,5)-(33,52)
(30,5)-(33,52)
(31,7)-(32,53)
(31,20)-(31,32)
(33,5)-(33,52)
(34,3)-(34,33)
*)

(* type error slice
(24,13)-(28,47)
(24,13)-(28,47)
(24,13)-(28,47)
(26,16)-(28,47)
(27,22)-(27,32)
*)
