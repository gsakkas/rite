
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
(31,5)-(33,76)
match a with
| (l1' , a') -> (l1' , bigAdd (mulByDigit x
                                          l1') a')
CaseG VarG [(TuplePatG (fromList [EmptyPatG]),Nothing,TupleG [EmptyG,EmptyG])]

(34,15)-(34,16)
l1
VarG

(34,18)-(34,20)
[]
ListG []

(35,14)-(35,33)
List.rev l2
AppG [VarG]

*)

(* type error slice
(5,4)-(8,70)
(5,17)-(8,68)
(5,20)-(8,68)
(7,43)-(7,59)
(7,44)-(7,55)
(7,56)-(7,58)
(13,4)-(24,37)
(13,12)-(24,35)
(13,15)-(24,35)
(24,19)-(24,34)
(24,20)-(24,27)
(24,31)-(24,33)
(27,17)-(27,23)
(27,17)-(27,48)
(27,24)-(27,25)
(27,26)-(27,48)
(27,27)-(27,37)
(27,46)-(27,47)
(30,3)-(36,50)
(30,9)-(33,76)
(30,11)-(33,76)
(31,5)-(33,76)
(32,5)-(33,76)
(32,19)-(32,20)
(33,5)-(33,76)
(33,27)-(33,29)
(33,40)-(33,76)
(33,44)-(33,75)
(33,45)-(33,51)
(33,52)-(33,74)
(33,53)-(33,70)
(33,54)-(33,64)
(33,67)-(33,69)
(36,17)-(36,31)
(36,17)-(36,43)
(36,32)-(36,33)
*)
