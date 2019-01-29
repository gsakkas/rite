
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 < s2
  then (((clone 0 (s2 - s1)) @ l1), l2)
  else if s2 < s1 then (l1, ((clone 0 (s1 - s2)) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h != 0 then h :: t else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match x with | [] -> [] in
    let base = ([], []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 < s2
  then (((clone 0 (s2 - s1)) @ l1), l2)
  else if s2 < s1 then (l1, ((clone 0 (s1 - s2)) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h != 0 then h :: t else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match snd a with
      | [] ->
          (((fst x) + (snd x)),
            [((fst x) + (snd x)) / 10; ((fst x) + (snd x)) mod 10])
      | h::t -> (0, []) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,16)-(16,39)
match snd a with
| [] -> (fst x + snd x , [(fst x + snd x) / 10 ; (fst x + snd x) mod 10])
| h :: t -> (0 , [])
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(16,22)-(16,23)
snd
VarG

(16,22)-(16,23)
a
VarG

(16,22)-(16,23)
fst
VarG

(16,22)-(16,23)
snd a
AppG (fromList [VarG])

(16,22)-(16,23)
fst x
AppG (fromList [VarG])

(16,22)-(16,23)
fst x + snd x
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(16,22)-(16,23)
(fst x + snd x , [(fst x + snd x) / 10 ; (fst x + snd x) mod 10])
TupleG (fromList [BopG EmptyG EmptyG,ListG EmptyG Nothing])

(16,37)-(16,39)
snd
VarG

(16,37)-(16,39)
x
VarG

(16,37)-(16,39)
fst
VarG

(16,37)-(16,39)
x
VarG

(16,37)-(16,39)
snd
VarG

(16,37)-(16,39)
x
VarG

(16,37)-(16,39)
fst
VarG

(16,37)-(16,39)
x
VarG

(16,37)-(16,39)
snd
VarG

(16,37)-(16,39)
x
VarG

(16,37)-(16,39)
snd x
AppG (fromList [VarG])

(16,37)-(16,39)
fst x
AppG (fromList [VarG])

(16,37)-(16,39)
snd x
AppG (fromList [VarG])

(16,37)-(16,39)
fst x
AppG (fromList [VarG])

(16,37)-(16,39)
snd x
AppG (fromList [VarG])

(16,37)-(16,39)
fst x + snd x
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(16,37)-(16,39)
(fst x + snd x) / 10
BopG (BopG EmptyG EmptyG) LitG

(16,37)-(16,39)
fst x + snd x
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(16,37)-(16,39)
(fst x + snd x) mod 10
BopG (BopG EmptyG EmptyG) LitG

(16,37)-(16,39)
10
LitG

(16,37)-(16,39)
10
LitG

(16,37)-(16,39)
0
LitG

(16,37)-(16,39)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(16,37)-(16,39)
[(fst x + snd x) / 10 ; (fst x + snd x) mod 10]
ListG (BopG EmptyG EmptyG) Nothing

(17,16)-(17,18)
0
LitG

*)
