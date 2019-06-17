
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
(31,5)-(34,52)
match a with
| (l1' , a') -> (l1' , bigAdd (mulByDigit x
                                          l1') a')
CaseG VarG [(TuplePatG (fromList [EmptyPatG]),Nothing,TupleG [EmptyG,EmptyG])]

(35,19)-(35,20)
[]
ListG []

*)

(* type error slice
(5,4)-(8,70)
(5,17)-(8,68)
(8,39)-(8,55)
(8,40)-(8,51)
(8,52)-(8,54)
(13,4)-(24,37)
(13,12)-(24,35)
(24,19)-(24,34)
(24,20)-(24,27)
(24,28)-(24,30)
(27,17)-(27,23)
(27,17)-(27,48)
(27,26)-(27,48)
(27,27)-(27,37)
(30,3)-(36,76)
(30,9)-(34,52)
(31,5)-(34,52)
(31,20)-(31,21)
(34,21)-(34,51)
(34,22)-(34,28)
(34,29)-(34,47)
(34,30)-(34,40)
(34,48)-(34,50)
(35,3)-(36,76)
(35,14)-(35,21)
(35,19)-(35,20)
(36,43)-(36,57)
(36,43)-(36,69)
(36,58)-(36,59)
(36,60)-(36,64)
*)
