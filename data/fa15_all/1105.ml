
let rec padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then padZero (0 :: l1) l2
  else
    if (List.length l1) > (List.length l2)
    then padZero l1 (0 :: l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | h::t ->
          let sum = ((fst x) + (snd x)) + (fst h) in
          ((sum / 10), (sum mod 10)) :: t in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let b = (fst x) + (snd x) in
      match a with
      | h::t -> ((h + b) / 10) :: ((h + b) mod 10) :: t
      | _ -> [b / 10; b mod 10] in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(4,8)-(4,28)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(7,10)-(7,30)
(l1 , clone 0
            (List.length l1 - List.length l2) @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(16,7)-(19,42)
let b = fst x + snd x in
match a with
| h :: t -> ((h + b) / 10) :: (((h + b) mod 10) :: t)
| _ -> [b / 10 ; b mod 10]
LetG NonRec (fromList [(VarPatG,BopG EmptyG EmptyG)]) (CaseG EmptyG (fromList [(ConsPatG EmptyPatG EmptyPatG,Nothing,EmptyG),(WildPatG,Nothing,EmptyG)]))

*)

(* type error slice
(11,3)-(11,70)
(11,40)-(11,41)
(11,40)-(11,45)
(11,44)-(11,45)
(11,51)-(11,61)
(11,51)-(11,63)
(11,62)-(11,63)
(14,3)-(22,35)
(14,12)-(21,75)
(15,5)-(21,75)
(15,11)-(19,42)
(16,7)-(19,42)
(16,13)-(16,14)
(18,43)-(18,50)
(18,44)-(18,47)
(18,48)-(18,49)
(20,5)-(21,75)
(21,5)-(21,75)
(21,49)-(21,63)
(21,49)-(21,75)
(21,64)-(21,65)
(22,3)-(22,13)
(22,3)-(22,35)
(22,14)-(22,35)
(22,15)-(22,18)
*)
