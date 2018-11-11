
let rec clone x n =
  let rec helper a b acc = if b > 0 then helper a (b - 1) (a :: acc) else acc in
  helper x n [];;

let padZero l1 l2 =
  let l1_len = List.length l1 in
  let l2_len = List.length l2 in
  let l_diff = l1_len - l2_len in
  if l_diff < 0
  then (((clone 0 (l_diff * (-1))) @ l1), l2)
  else (l1, ((clone 0 l_diff) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match x with | (a,b) -> (a + b) mod 10 in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (bar,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let rec helper a b acc = if b > 0 then helper a (b - 1) (a :: acc) else acc in
  helper x n [];;

let padZero l1 l2 =
  let l1_len = List.length l1 in
  let l2_len = List.length l2 in
  let l_diff = l1_len - l2_len in
  if l_diff < 0
  then (((clone 0 (l_diff * (-1))) @ l1), l2)
  else (l1, ((clone 0 l_diff) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (b1,b2) = a in
      match x with
      | (fir,sec) ->
          if (fir + sec) < 10
          then ([], ((fir + sec) :: b2))
          else ([], ((fir + sec) :: b2)) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (bar,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,16)-(19,54)
let (b1 , b2) = a in
match x with
| (fir , sec) -> if (fir + sec) < 10
                 then ([] , (fir + sec) :: b2)
                 else ([] , (fir + sec) :: b2)
LetG NonRec [VarG] (CaseG EmptyG [(Nothing,EmptyG)])

(19,22)-(19,23)
a
VarG

(19,22)-(19,23)
match x with
| (fir , sec) -> if (fir + sec) < 10
                 then ([] , (fir + sec) :: b2)
                 else ([] , (fir + sec) :: b2)
CaseG VarG [(Nothing,IteG EmptyG EmptyG EmptyG)]

(19,40)-(19,47)
(fir + sec) < 10
BopG (BopG EmptyG EmptyG) LitG

(19,40)-(19,54)
if (fir + sec) < 10
then ([] , (fir + sec) :: b2)
else ([] , (fir + sec) :: b2)
IteG (BopG EmptyG EmptyG) (TupleG [EmptyG,EmptyG]) (TupleG [EmptyG,EmptyG])

(19,45)-(19,46)
fir
VarG

(19,52)-(19,54)
sec
VarG

(20,4)-(22,53)
fir
VarG

(20,4)-(22,53)
sec
VarG

(20,4)-(22,53)
b2
VarG

(20,4)-(22,53)
fir
VarG

(20,4)-(22,53)
sec
VarG

(20,4)-(22,53)
b2
VarG

(20,4)-(22,53)
fir + sec
BopG VarG VarG

(20,4)-(22,53)
fir + sec
BopG VarG VarG

(20,4)-(22,53)
([] , (fir + sec) :: b2)
TupleG [ListG EmptyG Nothing,ConAppG (Just EmptyG) Nothing]

(20,4)-(22,53)
([] , (fir + sec) :: b2)
TupleG [ListG EmptyG Nothing,ConAppG (Just EmptyG) Nothing]

(20,4)-(22,53)
(fir + sec) :: b2
ConAppG (Just (TupleG [BopG VarG VarG,VarG])) Nothing

(20,4)-(22,53)
(fir + sec) :: b2
ConAppG (Just (TupleG [BopG VarG VarG,VarG])) Nothing

(20,4)-(22,53)
[]
ListG EmptyG Nothing

(20,4)-(22,53)
[]
ListG EmptyG Nothing

*)
