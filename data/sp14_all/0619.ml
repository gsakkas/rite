
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
      if (List.length a) = (List.length x)
      then c :: s
      else ((((c + x') + x'') / 10), ((((c + x') + x'') mod 10) :: s)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


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
      match (c, s) with
      | (c,[]) -> (c, (c :: s))
      | _ -> ((((c + x') + x'') / 10), ((((c + x') + x'') mod 10) :: s)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,7)-(20,71)
match (c , s) with
| (c , []) -> (c , c :: s)
| _ -> (((c + x') + x'') / 10 , (((c + x') + x'') mod 10) :: s)
CaseG (TupleG [EmptyG,EmptyG]) [(TuplePatG (fromList [EmptyPatG]),Nothing,TupleG [EmptyG,EmptyG]),(WildPatG,Nothing,TupleG [EmptyG,EmptyG])]

*)

(* type error slice
(16,7)-(20,71)
(16,22)-(16,23)
(17,7)-(20,71)
(17,19)-(17,20)
(18,7)-(20,71)
(18,10)-(18,25)
(18,11)-(18,22)
(18,23)-(18,24)
(18,28)-(18,43)
(18,29)-(18,40)
(18,41)-(18,42)
(19,12)-(19,18)
(20,12)-(20,71)
*)
