
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
      if (List.length s) = ((List.length l1) - 1)
      then (c, ((((c + x') + x'') / 10) :: (((c + x') + x'') mod 10) :: s))
      else ((((c + x') + x'') / 10), ((((c + x') + x'') mod 10) :: s)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i > 0 then bigAdd l (mulByDigit (i - 1) l) else [0];;

let bigMul l1 l2 =
  let f a x =
    let (l1',a') = a in
    match x with | [] -> a' | h::t -> bigAdd ((mulByDigit (h l1')) a') in
  let base = (l1, []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;


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
      if (List.length s) = ((List.length l1) - 1)
      then (c, ((((c + x') + x'') / 10) :: (((c + x') + x'') mod 10) :: s))
      else ((((c + x') + x'') / 10), ((((c + x') + x'') mod 10) :: s)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i > 0 then bigAdd l (mulByDigit (i - 1) l) else [0];;

let bigMul l1 l2 =
  let f a x =
    match a with | (l1',a') -> (l1', (bigAdd (mulByDigit x l1') a')) in
  let base = (l1, []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(31,5)-(32,70)
(32,5)-(32,70)
(32,11)-(32,12)
(32,26)-(32,28)
(32,39)-(32,45)
(32,39)-(32,70)
(32,48)-(32,65)
(32,48)-(32,70)
(32,60)-(32,61)
(32,60)-(32,65)
*)

(* type error slice
(3,51)-(3,56)
(3,51)-(3,65)
(3,57)-(3,58)
(3,60)-(3,65)
(5,4)-(8,70)
(5,17)-(8,67)
(5,20)-(8,67)
(6,3)-(8,67)
(6,7)-(6,18)
(6,7)-(6,21)
(6,19)-(6,21)
(6,26)-(6,37)
(6,26)-(6,40)
(6,38)-(6,40)
(7,9)-(7,11)
(7,9)-(7,66)
(7,15)-(7,20)
(7,15)-(7,58)
(7,15)-(7,66)
(7,21)-(7,22)
(7,25)-(7,58)
(7,62)-(7,63)
(7,64)-(7,66)
(11,3)-(11,70)
(11,51)-(11,61)
(11,51)-(11,63)
(11,62)-(11,63)
(13,4)-(24,37)
(13,12)-(24,33)
(13,15)-(24,33)
(14,3)-(24,33)
(14,12)-(23,52)
(15,5)-(23,52)
(15,11)-(20,69)
(15,13)-(20,69)
(16,7)-(20,69)
(16,22)-(16,23)
(17,7)-(20,69)
(17,19)-(17,20)
(18,7)-(20,69)
(18,30)-(18,41)
(18,30)-(18,44)
(18,42)-(18,44)
(19,13)-(19,14)
(19,13)-(19,74)
(19,20)-(19,74)
(21,5)-(23,52)
(21,17)-(21,18)
(21,17)-(21,22)
(21,20)-(21,22)
(22,5)-(23,52)
(22,16)-(22,24)
(22,16)-(22,44)
(22,26)-(22,38)
(22,26)-(22,44)
(22,39)-(22,41)
(22,42)-(22,44)
(23,5)-(23,52)
(23,19)-(23,33)
(23,19)-(23,45)
(23,34)-(23,35)
(23,36)-(23,40)
(23,41)-(23,45)
(23,49)-(23,52)
(24,3)-(24,13)
(24,3)-(24,33)
(24,15)-(24,18)
(24,15)-(24,33)
(24,20)-(24,27)
(24,20)-(24,33)
(24,28)-(24,30)
(24,31)-(24,33)
(27,27)-(27,37)
(27,27)-(27,47)
(27,39)-(27,44)
(27,46)-(27,47)
(30,3)-(34,76)
(30,9)-(32,70)
(30,11)-(32,70)
(31,5)-(32,70)
(31,20)-(31,21)
(32,5)-(32,70)
(32,11)-(32,12)
(32,26)-(32,28)
(32,39)-(32,45)
(32,39)-(32,70)
(32,48)-(32,58)
(32,48)-(32,65)
(32,48)-(32,70)
(32,68)-(32,70)
(33,3)-(34,76)
(33,15)-(33,17)
(33,15)-(33,21)
(33,19)-(33,21)
(34,3)-(34,76)
(34,14)-(34,22)
(34,14)-(34,25)
(34,23)-(34,25)
(34,43)-(34,57)
(34,43)-(34,69)
(34,58)-(34,59)
(34,60)-(34,64)
(34,65)-(34,69)
*)
