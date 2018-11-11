
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let dl = (List.length l1) - (List.length l2) in
  match dl with
  | 0 -> (l1, l2)
  | _ ->
      if dl > 0
      then (l1, ((clone 0 dl) @ l2))
      else (((clone 0 (dl / (-1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "TBD" in
    let base = [(0, 0)] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let dl = (List.length l1) - (List.length l2) in
  match dl with
  | 0 -> (l1, l2)
  | _ ->
      if dl > 0
      then (l1, ((clone 0 dl) @ l2))
      else (((clone 0 (dl / (-1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let z = (fst x) + (snd x) in
      match a with | (w,y) -> (((w + z) / 10), (((w + z) mod 10) :: y)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,16)-(18,30)
fst x + snd x
BopG (AppG [EmptyG]) (AppG [EmptyG])

(18,16)-(18,30)
let z = fst x + snd x in
match a with
| (w , y) -> ((w + z) / 10 , ((w + z) mod 10) :: y)
LetG NonRec [BopG EmptyG EmptyG] (CaseG EmptyG [(Nothing,EmptyG)])

(18,25)-(18,30)
fst
VarG

(19,4)-(21,51)
x
VarG

(19,4)-(21,51)
snd
VarG

(19,4)-(21,51)
x
VarG

(19,4)-(21,51)
a
VarG

(19,4)-(21,51)
w
VarG

(19,4)-(21,51)
z
VarG

(19,4)-(21,51)
w
VarG

(19,4)-(21,51)
z
VarG

(19,4)-(21,51)
y
VarG

(19,4)-(21,51)
snd x
AppG [VarG]

(19,4)-(21,51)
(w + z) / 10
BopG (BopG EmptyG EmptyG) LitG

(19,4)-(21,51)
w + z
BopG VarG VarG

(19,4)-(21,51)
(w + z) mod 10
BopG (BopG EmptyG EmptyG) LitG

(19,4)-(21,51)
w + z
BopG VarG VarG

(19,4)-(21,51)
10
LitG

(19,4)-(21,51)
10
LitG

(19,4)-(21,51)
match a with
| (w , y) -> ((w + z) / 10 , ((w + z) mod 10) :: y)
CaseG VarG [(Nothing,TupleG [EmptyG,EmptyG])]

(19,4)-(21,51)
((w + z) / 10 , ((w + z) mod 10) :: y)
TupleG [BopG EmptyG EmptyG,ConAppG (Just EmptyG) Nothing]

(19,4)-(21,51)
((w + z) mod 10) :: y
ConAppG (Just (TupleG [BopG (BopG VarG VarG) LitG,VarG])) Nothing

(19,20)-(19,21)
[]
ListG EmptyG Nothing

*)
