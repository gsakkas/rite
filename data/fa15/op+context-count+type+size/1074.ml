
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
(23,52)-(23,64)
(23,53)-(23,56)
(23,58)-(23,63)
*)

(* type error slice
(13,2)-(13,74)
(13,2)-(13,74)
(13,39)-(13,40)
(13,39)-(13,44)
(13,39)-(13,44)
(13,43)-(13,44)
(13,50)-(13,60)
(13,50)-(13,62)
(13,61)-(13,62)
(16,2)-(24,34)
(16,11)-(23,64)
(17,4)-(23,64)
(17,4)-(23,64)
(17,10)-(20,73)
(19,6)-(20,73)
(19,24)-(19,25)
(20,8)-(20,27)
(20,21)-(20,26)
(20,35)-(20,72)
(20,68)-(20,71)
(21,4)-(23,64)
(22,4)-(23,64)
(23,4)-(23,64)
(23,4)-(23,64)
(23,22)-(23,36)
(23,22)-(23,48)
(23,37)-(23,38)
(23,52)-(23,64)
(23,52)-(23,64)
(23,52)-(23,64)
(23,53)-(23,56)
(23,58)-(23,63)
(24,2)-(24,12)
(24,2)-(24,34)
(24,13)-(24,34)
(24,14)-(24,17)
*)
