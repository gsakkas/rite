
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
    match x with | [] -> a' | h::t -> bigAdd ((mulByDigit (h, l1')) a') in
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
(31,5)-(32,71)
(32,5)-(32,71)
(32,11)-(32,12)
(32,26)-(32,28)
(32,39)-(32,45)
(32,39)-(32,71)
(32,48)-(32,66)
(32,48)-(32,71)
(32,60)-(32,61)
(32,60)-(32,66)
*)

(* type error slice
(27,27)-(27,37)
(27,27)-(27,47)
(27,39)-(27,44)
(27,46)-(27,47)
(30,3)-(34,76)
(30,9)-(32,71)
(30,11)-(32,71)
(31,5)-(32,71)
(31,20)-(31,21)
(32,5)-(32,71)
(32,11)-(32,12)
(32,26)-(32,28)
(32,48)-(32,58)
(32,48)-(32,66)
(32,60)-(32,61)
(32,60)-(32,66)
(32,63)-(32,66)
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
