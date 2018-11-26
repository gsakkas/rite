
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
      match x with | (x,y)::t -> ((x + y) / 10) :: ((x + y) mod 10) :: t in
    let base = [] in
    let args = List.rev ((List.combine l1 l2) @ (0, 0)) in
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
(19,6)-(19,72)
let z = fst x + snd x in
match a with
| (w , y) -> ((w + z) / 10 , ((w + z) mod 10) :: y)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(19,12)-(19,13)
fst
VarG

(19,12)-(19,13)
fst x
AppG (fromList [VarG])

(19,12)-(19,13)
fst x + snd x
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(19,33)-(19,47)
snd
VarG

(19,33)-(19,47)
x
VarG

(19,33)-(19,47)
a
VarG

(19,33)-(19,47)
match a with
| (w , y) -> ((w + z) / 10 , ((w + z) mod 10) :: y)
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(19,33)-(19,47)
((w + z) / 10 , ((w + z) mod 10) :: y)
TupleG (fromList [BopG EmptyG EmptyG,ConAppG (Just EmptyG) Nothing])

(19,33)-(19,72)
snd x
AppG (fromList [VarG])

(19,39)-(19,40)
w
VarG

(19,44)-(19,46)
z
VarG

(19,57)-(19,58)
w
VarG

(19,64)-(19,66)
z
VarG

(19,71)-(19,72)
y
VarG

(20,15)-(20,17)
0
LitG

(20,15)-(20,17)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

*)
