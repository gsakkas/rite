
let bigMul l1 l2 =
  let f a x = failwith "to be implemented" in
  let base = (1, []) in
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
(3,15)-(3,43)
match a with
| (l1' , a') -> (l1' , bigAdd (mulByDigit x
                                          l1') a')
CaseG VarG (fromList [(TuplePatG (fromList [VarPatG]),Nothing,TupleG (fromList [EmptyG]))])

(4,15)-(4,16)
l1
VarG

(5,14)-(5,33)
List.rev l2
AppG (fromList [VarG])

*)

(* type error slice
(5,3)-(6,50)
(5,14)-(5,33)
(6,17)-(6,31)
(6,17)-(6,43)
(6,39)-(6,43)
*)
