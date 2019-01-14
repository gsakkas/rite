
let rec clone x n =
  if n < 1 then [] else if n = 1 then [x] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match l1 with | [] -> [] | h::t -> (x + h) :: a in
    let base = [] in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero (List.rev l1) (List.rev l2)));;


(* fix

let rec clone x n =
  if n < 1 then [] else if n = 1 then [x] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let sum = (fst x) + (snd x) in
      if sum > 9
      then (1, (((sum - 10) + (fst a)) :: (snd a)))
      else (0, ((sum + (fst a)) :: (snd a))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero (List.rev l1) (List.rev l2)));;

*)

(* changed spans
(17,51)-(17,63)
let sum = fst x + snd x in
if sum > 9
then (1 , ((sum - 10) + fst a) :: (snd a))
else (0 , (sum + fst a) :: (snd a))
LetG NonRec (fromList [BopG EmptyG EmptyG]) (IteG EmptyG EmptyG EmptyG)

(17,52)-(17,53)
fst
VarG

(17,52)-(17,53)
fst x
AppG (fromList [VarG])

(17,56)-(17,57)
snd x
AppG (fromList [VarG])

(17,62)-(17,63)
snd
VarG

(17,62)-(17,63)
x
VarG

(17,62)-(17,63)
sum
VarG

(17,62)-(17,63)
sum
VarG

(17,62)-(17,63)
fst
VarG

(17,62)-(17,63)
fst a
AppG (fromList [VarG])

(17,62)-(17,63)
sum > 9
BopG VarG LitG

(17,62)-(17,63)
(sum - 10) + fst a
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

(17,62)-(17,63)
sum - 10
BopG VarG LitG

(17,62)-(17,63)
9
LitG

(17,62)-(17,63)
1
LitG

(17,62)-(17,63)
10
LitG

(17,62)-(17,63)
if sum > 9
then (1 , ((sum - 10) + fst a) :: (snd a))
else (0 , (sum + fst a) :: (snd a))
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(17,62)-(17,63)
(1 , ((sum - 10) + fst a) :: (snd a))
TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [AppG (fromList [VarG]),BopG (BopG VarG LitG) (AppG (fromList [VarG]))]))) Nothing])

(17,62)-(17,63)
((sum - 10) + fst a) :: (snd a)
ConAppG (Just (TupleG (fromList [AppG (fromList [VarG]),BopG (BopG VarG LitG) (AppG (fromList [VarG]))]))) Nothing

(18,4)-(19,68)
snd
VarG

(18,4)-(19,68)
a
VarG

(18,4)-(19,68)
sum
VarG

(18,4)-(19,68)
fst
VarG

(18,4)-(19,68)
a
VarG

(18,4)-(19,68)
snd
VarG

(18,4)-(19,68)
a
VarG

(18,4)-(19,68)
snd a
AppG (fromList [VarG])

(18,4)-(19,68)
fst a
AppG (fromList [VarG])

(18,4)-(19,68)
snd a
AppG (fromList [VarG])

(18,4)-(19,68)
sum + fst a
BopG VarG (AppG (fromList [EmptyG]))

(18,4)-(19,68)
0
LitG

(18,4)-(19,68)
(0 , (sum + fst a) :: (snd a))
TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [AppG (fromList [VarG]),BopG VarG (AppG (fromList [VarG]))]))) Nothing])

(18,4)-(19,68)
(sum + fst a) :: (snd a)
ConAppG (Just (TupleG (fromList [AppG (fromList [VarG]),BopG VarG (AppG (fromList [VarG]))]))) Nothing

(18,15)-(18,17)
0
LitG

(18,15)-(18,17)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(19,15)-(19,17)
List.combine
VarG

(19,15)-(19,17)
l1
VarG

(19,15)-(19,17)
List.combine l1 l2
AppG (fromList [VarG])

*)
