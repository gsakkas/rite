
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
    let (i,l) = x in
    let (i',l') = a in
    match i with | [] -> l' | h::t -> bigAdd ((mulByDigit h l') l') in
  let base = (1, l1) in
  let args = ((List.rev l2), l1) in
  let (_,res) = List.fold_left f base args in res;;


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
(31,5)-(33,67)
(31,17)-(31,18)
(32,5)-(33,67)
(33,5)-(33,67)
(33,11)-(33,12)
(33,26)-(33,28)
(33,39)-(33,45)
(33,39)-(33,67)
(33,48)-(33,67)
(33,59)-(33,60)
(33,61)-(33,63)
(33,65)-(33,67)
(34,3)-(36,50)
(34,15)-(34,16)
(35,3)-(36,50)
(35,16)-(35,32)
(35,30)-(35,32)
(36,47)-(36,50)
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
(30,3)-(36,50)
(30,9)-(33,67)
(30,11)-(33,67)
(31,5)-(33,67)
(31,17)-(31,18)
(32,5)-(33,67)
(32,19)-(32,20)
(33,5)-(33,67)
(33,26)-(33,28)
(33,39)-(33,45)
(33,39)-(33,67)
(33,48)-(33,58)
(33,48)-(33,63)
(33,48)-(33,67)
(33,59)-(33,60)
(33,61)-(33,63)
(33,65)-(33,67)
(34,3)-(36,50)
(34,15)-(34,16)
(34,15)-(34,20)
(34,18)-(34,20)
(35,3)-(36,50)
(35,16)-(35,24)
(35,16)-(35,27)
(35,16)-(35,32)
(35,25)-(35,27)
(35,30)-(35,32)
(36,17)-(36,31)
(36,17)-(36,43)
(36,32)-(36,33)
(36,34)-(36,38)
(36,39)-(36,43)
*)
