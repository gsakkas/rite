
let rec clone x n =
  match n with | y when y <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) <= (List.length l2) with
  | true  ->
      ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  | false  ->
      (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let sum = (fst x) + (snd x) in
      match a with
      | [] -> (sum / 10) :: (sum mod 10) :: a
      | h::t -> (sum / 10) :: (h + (sum mod 10)) :: t in
    let base = [] in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | y when y <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) <= (List.length l2) with
  | true  ->
      ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  | false  ->
      (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let b = (fst x) + (snd x) in
      match a with
      | (0,[]) -> ((b / 10), [b mod 10])
      | (y,h::t) -> ((b / 10), ((b mod 10) :: (h + y) :: t)) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(20,6)-(23,53)
let b = fst x + snd x in
match a with
| (0 , []) -> (b / 10 , [b mod 10])
| (y , h :: t) -> (b / 10 , (b mod 10) :: ((h + y) :: t))
LetG NonRec (fromList [BopG EmptyG EmptyG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(21,6)-(23,53)
match a with
| (0 , []) -> (b / 10 , [b mod 10])
| (y , h :: t) -> (b / 10 , (b mod 10) :: ((h + y) :: t))
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(22,14)-(22,45)
(b / 10 , [b mod 10])
TupleG (fromList [BopG EmptyG EmptyG,ListG EmptyG Nothing])

(22,15)-(22,18)
b
VarG

(22,28)-(22,45)
[b mod 10]
ListG (BopG EmptyG EmptyG) Nothing

(22,29)-(22,32)
b
VarG

(23,16)-(23,53)
(b / 10 , (b mod 10) :: ((h + y) :: t))
TupleG (fromList [BopG EmptyG EmptyG,ConAppG (Just EmptyG) Nothing])

(23,17)-(23,20)
b
VarG

(23,35)-(23,47)
h
VarG

(23,35)-(23,47)
y
VarG

(23,35)-(23,47)
h + y
BopG VarG VarG

(23,35)-(23,47)
(h + y) :: t
ConAppG (Just (TupleG (fromList [VarG,BopG VarG VarG]))) Nothing

(23,36)-(23,39)
b
VarG

(23,44)-(23,46)
0
LitG

(23,44)-(23,46)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

*)
