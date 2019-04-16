
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
  let f a x = match x with | [] -> a | h::t -> bigAdd ((mulByDigit h a) a) in
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
(30,15)-(30,75)
match a with
| (l1' , a') -> (l1' , bigAdd (mulByDigit x
                                          l1') a')
CaseG VarG (fromList [(TuplePatG (fromList [VarPatG]),Nothing,TupleG (fromList [EmptyG]))])

(31,14)-(31,16)
(l1 , [])
TupleG (fromList [VarG,ListG (fromList [])])

*)

(* type error slice
(5,4)-(8,70)
(5,17)-(8,68)
(5,20)-(8,68)
(7,43)-(7,59)
(7,44)-(7,55)
(7,56)-(7,58)
(8,39)-(8,55)
(8,40)-(8,51)
(8,52)-(8,54)
(13,4)-(24,37)
(13,12)-(24,35)
(13,15)-(24,35)
(24,19)-(24,34)
(24,20)-(24,27)
(24,28)-(24,30)
(24,31)-(24,33)
(27,17)-(27,23)
(27,17)-(27,48)
(27,24)-(27,25)
(27,26)-(27,48)
(27,27)-(27,37)
(27,46)-(27,47)
(30,3)-(32,76)
(30,9)-(30,75)
(30,15)-(30,75)
(30,36)-(30,37)
(30,48)-(30,54)
(30,48)-(30,75)
(30,55)-(30,75)
(30,56)-(30,72)
(30,57)-(30,67)
(30,70)-(30,71)
(32,29)-(32,76)
(32,43)-(32,57)
(32,43)-(32,69)
(32,58)-(32,59)
*)
