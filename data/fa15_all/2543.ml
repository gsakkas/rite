
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1, (pad @ l2))
  else (let pad = clone 0 (- sizDif) in ((pad @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      if ((x1 + x2) + a1) >= 10
      then (1, ((((x1 + x2) + a1) - 10) :: a2))
      else (0, (((x1 + x2) + a1) :: a2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (carry,res) = List.fold_left f base args in carry :: res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 0 -> [] | 1 -> l | n -> bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x = let (a1,a2) = a in bigAdd a2 ((mulByDigit (x l1) 10) ** a1) in
  let base = (0, []) in
  let args = List.rev l1 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1, (pad @ l2))
  else (let pad = clone 0 (- sizDif) in ((pad @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let rec appZero x l = if x > 0 then l @ [] else appZero (x - 1) l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      if ((x1 + x2) + a1) >= 10
      then (1, ((((x1 + x2) + a1) - 10) :: a2))
      else (0, (((x1 + x2) + a1) :: a2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (carry,res) = List.fold_left f base args in carry :: res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 0 -> [] | 1 -> l | n -> bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    let (a1,a2) = a in ((a1 + 1), (bigAdd a2 (appZero a1 (mulByDigit x l2)))) in
  let base = (0, []) in
  let args = List.rev l1 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(13,11)-(24,34)
x
VarG

(13,11)-(24,34)
l
VarG

(13,11)-(24,34)
(@)
VarG

(13,11)-(24,34)
appZero
VarG

(13,11)-(24,34)
x
VarG

(13,11)-(24,34)
l
VarG

(13,11)-(24,34)
fun x ->
  fun l ->
    if x > 0
    then l @ []
    else appZero (x - 1) l
LamG (LamG EmptyG)

(13,11)-(24,34)
fun l ->
  if x > 0
  then l @ []
  else appZero (x - 1) l
LamG (IteG EmptyG EmptyG EmptyG)

(13,11)-(24,34)
l @ []
AppG (fromList [VarG,ListG EmptyG Nothing])

(13,11)-(24,34)
appZero (x - 1) l
AppG (fromList [VarG,BopG EmptyG EmptyG])

(13,11)-(24,34)
x > 0
BopG VarG LitG

(13,11)-(24,34)
x - 1
BopG VarG LitG

(13,11)-(24,34)
0
LitG

(13,11)-(24,34)
1
LitG

(13,11)-(24,34)
if x > 0
then l @ []
else appZero (x - 1) l
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(13,11)-(24,34)
[]
ListG EmptyG Nothing

(30,33)-(30,73)
a1
VarG

(30,33)-(30,73)
a1 + 1
BopG VarG LitG

(30,33)-(30,73)
1
LitG

(30,33)-(30,73)
(a1 + 1 , bigAdd a2
                 (appZero a1 (mulByDigit x
                                         l2)))
TupleG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

(30,44)-(30,66)
a1
VarG

(30,67)-(30,69)
appZero
VarG

(30,70)-(30,72)
l2
VarG

*)
