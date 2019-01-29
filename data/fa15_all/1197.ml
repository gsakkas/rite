
let rec clone x n =
  let rec helper a x n =
    if n <= 0 then a else (let a' = x :: a in helper a' x (n - 1)) in
  helper [] x n;;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  if length1 > length2
  then (l1, (List.append (clone 0 (length1 - length2)) l2))
  else
    if length2 > length1
    then ((List.append (clone 0 (length2 - length1)) l1), l2)
    else (l1, l2);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (x1,x2) ->
          (match a with
           | (o,z) ->
               if ((o + x1) + x2) > 9
               then (1, ((((o + x1) + x2) mod 10) :: z))
               else (0, (((o + x1) + x2) :: z))) in
    let base = (0, []) in
    let args =
      let rec pair list1 list2 =
        match (list1, list2) with
        | (h1::t1,h2::t2) -> (h1, h2) :: (pair t1 t2)
        | (_,_) -> [] in
      pair List.rev l1 List.rev l2 in
    let (_,res) = List.fold_left f base args in args in
  add (padZero l1 l2);;


(* fix

let rec clone x n =
  let rec helper a x n =
    if n <= 0 then a else (let a' = x :: a in helper a' x (n - 1)) in
  helper [] x n;;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  if length1 > length2
  then (l1, (List.append (clone 0 (length1 - length2)) l2))
  else
    if length2 > length1
    then ((List.append (clone 0 (length2 - length1)) l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (x1,x2) ->
          (match a with
           | (o,z) ->
               if ((o + x1) + x2) > 9
               then (1, ((((o + x1) + x2) mod 10) :: z))
               else (0, (((o + x1) + x2) :: z))) in
    let base = (0, []) in
    let args =
      let rec pair list1 list2 =
        match (list1, list2) with
        | (h1::t1,h2::t2) -> (h1, h2) :: (pair t1 t2)
        | (_,_) -> [] in
      pair (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(17,11)-(35,21)
l
VarG

(17,11)-(35,21)
h
VarG

(17,11)-(35,21)
removeZero
VarG

(17,11)-(35,21)
t
VarG

(17,11)-(35,21)
l
VarG

(17,11)-(35,21)
fun l ->
  match l with
  | [] -> []
  | h :: t -> if h = 0
              then removeZero t
              else l
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(17,11)-(35,21)
removeZero t
AppG (fromList [VarG])

(17,11)-(35,21)
h = 0
BopG VarG LitG

(17,11)-(35,21)
0
LitG

(17,11)-(35,21)
if h = 0
then removeZero t
else l
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) VarG

(17,11)-(35,21)
match l with
| [] -> []
| h :: t -> if h = 0
            then removeZero t
            else l
CaseG VarG (fromList [(Nothing,IteG EmptyG EmptyG EmptyG),(Nothing,ListG EmptyG Nothing)])

(17,11)-(35,21)
[]
ListG EmptyG Nothing

(33,6)-(33,34)
pair (List.rev l1)
     (List.rev l2)
AppG (fromList [AppG (fromList [EmptyG])])

(33,11)-(33,19)
List.rev l1
AppG (fromList [VarG])

(33,23)-(33,31)
List.rev l2
AppG (fromList [VarG])

(34,48)-(34,52)
res
VarG

(35,2)-(35,5)
removeZero
VarG

(35,2)-(35,5)
add (padZero l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

*)
