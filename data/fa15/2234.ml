
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
[x]
ListG [VarG]

(20,50)-(20,60)
[x mod 10]
ListG [BopG EmptyG EmptyG]

*)

(* type error slice
(18,5)-(30,52)
(18,11)-(25,44)
(18,13)-(25,44)
(19,7)-(25,44)
(19,13)-(19,14)
(20,19)-(20,61)
(20,46)-(20,61)
(20,50)-(20,60)
(21,18)-(21,74)
(21,37)-(21,45)
(21,43)-(21,44)
(21,52)-(21,74)
(21,56)-(21,73)
(23,11)-(25,44)
(25,16)-(25,44)
(25,20)-(25,43)
(30,19)-(30,33)
(30,19)-(30,45)
(30,34)-(30,35)
*)
