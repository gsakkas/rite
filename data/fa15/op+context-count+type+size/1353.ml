
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
(20,38)-(20,39)
(20,51)-(20,59)
*)

(* type error slice
(18,5)-(30,52)
(18,11)-(25,42)
(18,13)-(25,42)
(19,7)-(25,42)
(19,7)-(25,42)
(19,7)-(25,42)
(19,7)-(25,42)
(19,13)-(19,14)
(20,19)-(20,59)
(20,22)-(20,23)
(20,22)-(20,28)
(20,22)-(20,28)
(20,26)-(20,28)
(20,35)-(20,39)
(20,38)-(20,39)
(21,18)-(21,72)
(21,34)-(21,44)
(21,38)-(21,39)
(21,38)-(21,44)
(21,38)-(21,44)
(21,38)-(21,44)
(21,43)-(21,44)
(23,11)-(25,42)
(24,17)-(24,33)
(24,22)-(24,33)
(30,19)-(30,33)
(30,19)-(30,45)
(30,34)-(30,35)
*)
