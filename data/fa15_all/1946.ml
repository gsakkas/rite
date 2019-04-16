
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      ((((x1 + x2) + carry) / 10), ((((x1 + x2) + carry) mod 10) :: res)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (carry,res) = List.fold_left f base args in [res; carry] in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      ((((x1 + x2) + carry) / 10), ((((x1 + x2) + carry) mod 10) :: res)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (carry,res) = List.fold_left f base args in res @ [carry] in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,53)-(23,65)
res @ [carry]
AppG (fromList [VarG,ListG (fromList [EmptyG])])

*)

(* type error slice
(13,3)-(13,75)
(13,40)-(13,41)
(13,40)-(13,45)
(13,44)-(13,45)
(13,51)-(13,61)
(13,51)-(13,63)
(13,62)-(13,63)
(16,3)-(24,35)
(16,12)-(23,65)
(17,5)-(23,65)
(17,11)-(20,74)
(19,7)-(20,74)
(19,25)-(19,26)
(20,9)-(20,28)
(20,22)-(20,27)
(20,36)-(20,73)
(20,69)-(20,72)
(21,5)-(23,65)
(22,5)-(23,65)
(23,5)-(23,65)
(23,23)-(23,37)
(23,23)-(23,49)
(23,38)-(23,39)
(23,53)-(23,65)
(23,54)-(23,57)
(23,59)-(23,64)
(24,3)-(24,13)
(24,3)-(24,35)
(24,14)-(24,35)
(24,15)-(24,18)
*)
