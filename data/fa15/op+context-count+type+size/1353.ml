
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
      | (0,[]) -> if x < 10 then (0, x) else (1, (x mod 10))
      | (0,l) -> if x < 10 then (0, (x :: l)) else (1, ((x mod 10) :: l))
      | (1,l) ->
          if (x + 1) < 10
          then (0, ((x + 1) :: l))
          else (1, ((x + (1 mod 10)) :: l)) in
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
      | (0,[]) -> if x < 10 then (0, [x]) else (1, [x mod 10])
      | (0,l) -> if x < 10 then (0, (x :: l)) else (1, ((x mod 10) :: l))
      | (1,l) ->
          if (x + 1) < 10
          then (0, ((x + 1) :: l))
          else (1, ((x + (1 mod 10)) :: l)) in
    let base = (0, []) in
    let args =
      let combine (a,b) = a + b in
      List.map combine (List.rev (List.combine l1 l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(20,37)-(20,38)
(20,49)-(20,59)
*)

(* type error slice
(18,4)-(30,51)
(18,10)-(25,43)
(18,12)-(25,43)
(19,6)-(25,43)
(19,6)-(25,43)
(19,6)-(25,43)
(19,6)-(25,43)
(19,12)-(19,13)
(20,18)-(20,60)
(20,21)-(20,22)
(20,21)-(20,27)
(20,21)-(20,27)
(20,25)-(20,27)
(20,33)-(20,39)
(20,37)-(20,38)
(21,17)-(21,73)
(21,32)-(21,45)
(21,36)-(21,44)
(21,36)-(21,44)
(21,36)-(21,44)
(21,37)-(21,38)
(21,42)-(21,43)
(23,10)-(25,43)
(24,15)-(24,34)
(24,19)-(24,33)
(30,18)-(30,32)
(30,18)-(30,44)
(30,33)-(30,34)
*)
