
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
      match x with
      | (w,y)::t -> ((w + y) / 10) :: ((w + y) mod 10) :: t
      | _ -> a in
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
(19,6)-(21,14)
let z = fst x + snd x in
match a with
| (w , y) -> ((w + z) / 10 , ((w + z) mod 10) :: y)
LetG NonRec [BopG EmptyG EmptyG] (CaseG EmptyG [(Nothing,EmptyG)])

(19,12)-(19,13)
fst
VarG

(19,12)-(19,13)
fst x
AppG [VarG]

(19,12)-(19,13)
fst x + snd x
BopG (AppG [EmptyG]) (AppG [EmptyG])

(20,20)-(20,34)
snd
VarG

(20,20)-(20,34)
x
VarG

(20,20)-(20,34)
a
VarG

(20,20)-(20,34)
match a with
| (w , y) -> ((w + z) / 10 , ((w + z) mod 10) :: y)
CaseG VarG [(Nothing,TupleG [EmptyG,EmptyG])]

(20,20)-(20,34)
((w + z) / 10 , ((w + z) mod 10) :: y)
TupleG [BopG EmptyG EmptyG,ConAppG (Just EmptyG) Nothing]

(20,20)-(20,59)
snd x
AppG [VarG]

(20,26)-(20,27)
z
VarG

(20,44)-(20,45)
z
VarG

(21,13)-(21,14)
y
VarG

(22,15)-(22,17)
0
LitG

(22,15)-(22,17)
(0 , [])
TupleG [LitG,ListG EmptyG Nothing]

*)
