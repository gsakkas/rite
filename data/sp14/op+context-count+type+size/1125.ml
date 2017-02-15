
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
    match i' with | [] -> l' | h::t -> (t, (bigAdd ((mulByDigit h l') l'))) in
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
(31,4)-(33,75)
(31,16)-(31,17)
(32,4)-(33,75)
(33,4)-(33,75)
(33,10)-(33,12)
(33,26)-(33,28)
(33,40)-(33,41)
(33,43)-(33,74)
(33,44)-(33,50)
(33,51)-(33,73)
(33,64)-(33,65)
(33,66)-(33,68)
(33,70)-(33,72)
(34,2)-(36,49)
(34,13)-(34,20)
(34,14)-(34,15)
(35,2)-(36,49)
(35,13)-(35,32)
(35,14)-(35,27)
(35,29)-(35,31)
(36,2)-(36,49)
(36,16)-(36,42)
*)

(* type error slice
(5,3)-(8,69)
(5,16)-(8,67)
(5,19)-(8,67)
(7,42)-(7,58)
(7,43)-(7,54)
(7,55)-(7,57)
(13,3)-(24,36)
(13,11)-(24,34)
(13,14)-(24,34)
(24,18)-(24,33)
(24,19)-(24,26)
(24,30)-(24,32)
(27,16)-(27,22)
(27,16)-(27,47)
(27,23)-(27,24)
(27,25)-(27,47)
(27,26)-(27,36)
(27,45)-(27,46)
(30,2)-(36,49)
(30,8)-(33,75)
(30,10)-(33,75)
(31,4)-(33,75)
(32,4)-(33,75)
(32,4)-(33,75)
(32,18)-(32,19)
(33,4)-(33,75)
(33,4)-(33,75)
(33,26)-(33,28)
(33,39)-(33,75)
(33,43)-(33,74)
(33,44)-(33,50)
(33,51)-(33,73)
(33,52)-(33,69)
(33,53)-(33,63)
(33,66)-(33,68)
(36,16)-(36,30)
(36,16)-(36,42)
(36,31)-(36,32)
*)
