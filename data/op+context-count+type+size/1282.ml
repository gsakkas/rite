
let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let c = 3;;

let rec padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (s,t) = x in ((((c + s) + t) / 10), (((c + s) + t) mod 10)) :: a in
    let base = [(0, 0)] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x',x'') = x in
      let (c,s) = a in
      ((((c + x') + x'') / 10), ((((c + x') + x'') mod 10) :: s)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(5,9)-(5,10)
(18,28)-(18,68)
(18,28)-(18,75)
(18,32)-(18,33)
(18,37)-(18,38)
(18,42)-(18,44)
(18,50)-(18,68)
(18,54)-(18,55)
(18,59)-(18,60)
(18,66)-(18,68)
(18,74)-(18,75)
(19,16)-(19,24)
(19,21)-(19,22)
*)

(* type error slice
(17,5)-(21,52)
(17,11)-(18,75)
(17,13)-(18,75)
(18,7)-(18,75)
(18,19)-(18,20)
(18,28)-(18,44)
(18,28)-(18,68)
(18,28)-(18,75)
(18,50)-(18,68)
(18,74)-(18,75)
(19,5)-(21,52)
(19,16)-(19,24)
(19,18)-(19,19)
(19,18)-(19,22)
(19,21)-(19,22)
(20,5)-(21,52)
(20,16)-(20,24)
(20,16)-(20,44)
(20,26)-(20,38)
(20,26)-(20,44)
(20,39)-(20,41)
(20,42)-(20,44)
(21,5)-(21,52)
(21,19)-(21,33)
(21,19)-(21,45)
(21,34)-(21,35)
(21,36)-(21,40)
(21,41)-(21,45)
*)
