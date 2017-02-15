
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
               then (0, ((x + 1) :: l))
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
(21,10)-(28,49)
(21,13)-(21,14)
(21,13)-(21,18)
(21,17)-(21,18)
(22,15)-(22,73)
(22,19)-(22,25)
(22,23)-(22,25)
(22,31)-(22,44)
(22,32)-(22,33)
(22,35)-(22,43)
(22,36)-(22,37)
(22,41)-(22,42)
(22,50)-(22,72)
(22,51)-(22,52)
(22,54)-(22,71)
(22,55)-(22,65)
(22,56)-(22,57)
(22,62)-(22,64)
(22,69)-(22,70)
(24,12)-(28,49)
(24,15)-(24,16)
(24,15)-(24,20)
(24,19)-(24,20)
(26,14)-(28,49)
(26,18)-(26,25)
(26,19)-(26,20)
(26,23)-(26,24)
(27,25)-(27,32)
(27,30)-(27,31)
(28,26)-(28,33)
(28,31)-(28,32)
(29,4)-(33,51)
(30,4)-(33,51)
(31,6)-(32,54)
(31,19)-(31,31)
(31,26)-(31,27)
(32,6)-(32,14)
(32,6)-(32,54)
(33,4)-(33,51)
*)

(* type error slice
(24,12)-(28,49)
(24,12)-(28,49)
(24,12)-(28,49)
(26,14)-(28,49)
(27,20)-(27,39)
*)
