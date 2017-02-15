
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
    let base = (0, []) in
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
(5,8)-(5,9)
(16,2)-(22,34)
(17,4)-(21,51)
(18,6)-(18,74)
(18,23)-(18,69)
(18,23)-(18,74)
(18,31)-(18,32)
(18,36)-(18,37)
(18,41)-(18,43)
(18,46)-(18,68)
(18,53)-(18,54)
(18,58)-(18,59)
(18,65)-(18,67)
(18,73)-(18,74)
*)

(* type error slice
(17,4)-(21,51)
(17,10)-(18,74)
(18,23)-(18,74)
(18,73)-(18,74)
(19,4)-(21,51)
(19,15)-(19,22)
(21,18)-(21,32)
(21,18)-(21,44)
(21,33)-(21,34)
(21,35)-(21,39)
*)
