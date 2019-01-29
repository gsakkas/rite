
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l = match l with | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match (a, x) with
      | ((b,c),(d,e)) ->
          ((((d + e) + b) / 10), ((((d + e) + b) mod 10) :: c)) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l = (mulByDigit i) - (1 bigAdd l l);;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l = match l with | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match (a, x) with
      | ((b,c),(d,e)) ->
          ((((d + e) + b) / 10), ((((d + e) + b) mod 10) :: c)) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let rec helper i acc l = if i > 0 then helper i (bigAdd acc l) l else acc in
  helper i [] l;;

*)

(* changed spans
(22,26)-(22,36)
let rec helper =
  fun i ->
    fun acc ->
      fun l ->
        if i > 0
        then helper i (bigAdd acc l) l
        else acc in
helper i [] l
LetG Rec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(22,37)-(22,38)
fun i ->
  fun acc ->
    fun l ->
      if i > 0
      then helper i (bigAdd acc l) l
      else acc
LamG (LamG EmptyG)

(22,37)-(22,38)
fun acc ->
  fun l ->
    if i > 0
    then helper i (bigAdd acc l) l
    else acc
LamG (LamG EmptyG)

(22,37)-(22,38)
fun l ->
  if i > 0
  then helper i (bigAdd acc l) l
  else acc
LamG (IteG EmptyG EmptyG EmptyG)

(22,37)-(22,38)
i > 0
BopG VarG LitG

(22,37)-(22,38)
if i > 0
then helper i (bigAdd acc l) l
else acc
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) VarG

(22,42)-(22,56)
0
LitG

(22,43)-(22,44)
helper
VarG

(22,45)-(22,51)
i
VarG

(22,45)-(22,51)
bigAdd acc l
AppG (fromList [VarG])

(22,52)-(22,53)
acc
VarG

*)
