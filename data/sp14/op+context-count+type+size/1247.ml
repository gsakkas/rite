
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
    match x with
    | [] -> (l1', a')
    | h::t -> (l1', (bigAdd (mulByDigit h l1') a')) in
  let base = (l1, 0) in
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
(31,4)-(34,51)
(32,4)-(34,51)
(32,10)-(32,11)
(33,18)-(33,20)
(34,14)-(34,51)
(34,15)-(34,18)
(34,40)-(34,41)
(35,2)-(36,75)
(35,18)-(35,19)
(36,2)-(36,75)
(36,13)-(36,24)
(36,28)-(36,75)
*)

(* type error slice
(5,3)-(8,69)
(5,16)-(8,67)
(8,38)-(8,54)
(8,39)-(8,50)
(8,51)-(8,53)
(13,3)-(24,36)
(13,11)-(24,34)
(24,18)-(24,33)
(24,19)-(24,26)
(24,27)-(24,29)
(27,16)-(27,22)
(27,16)-(27,47)
(27,25)-(27,47)
(27,26)-(27,36)
(30,2)-(36,75)
(30,8)-(34,51)
(31,4)-(34,51)
(31,19)-(31,20)
(34,20)-(34,50)
(34,21)-(34,27)
(34,28)-(34,46)
(34,29)-(34,39)
(34,47)-(34,49)
(35,2)-(36,75)
(35,13)-(35,20)
(35,18)-(35,19)
(36,42)-(36,56)
(36,42)-(36,68)
(36,57)-(36,58)
(36,59)-(36,63)
*)
