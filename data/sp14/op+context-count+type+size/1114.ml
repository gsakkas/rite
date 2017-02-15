
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
  let f a x = match x with | [] -> a | h::t -> bigAdd ((mulByDigit (h a)) a) in
  let base = l1 in
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
(30,14)-(30,76)
(30,20)-(30,21)
(30,47)-(30,53)
(30,47)-(30,76)
(30,54)-(30,76)
(30,55)-(30,73)
(30,67)-(30,72)
(30,68)-(30,69)
(30,70)-(30,71)
(30,74)-(30,75)
(31,2)-(32,75)
(31,13)-(31,15)
(32,2)-(32,75)
(32,13)-(32,24)
(32,28)-(32,75)
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
(27,23)-(27,24)
(27,25)-(27,47)
(27,26)-(27,36)
(27,45)-(27,46)
(30,2)-(32,75)
(30,8)-(30,76)
(30,14)-(30,76)
(30,14)-(30,76)
(30,35)-(30,36)
(30,47)-(30,53)
(30,47)-(30,76)
(30,54)-(30,76)
(30,55)-(30,73)
(30,56)-(30,66)
(30,74)-(30,75)
(32,28)-(32,75)
(32,42)-(32,56)
(32,42)-(32,68)
(32,57)-(32,58)
*)
