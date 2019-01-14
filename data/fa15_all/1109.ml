
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | h::t ->
          (match h with
           | (b,c) ->
               (match x with
                | (first,second) ->
                    ((((first + second) + b) / 10),
                      ((((first + second) + b) mod 10) :: t)))) in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let b = (fst x) + (snd x) in
      match a with
      | h::t -> ((h + b) / 10) :: ((h + b) mod 10) :: t
      | _ -> [b / 10; b mod 10] in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(22,15)-(25,62)
let b = fst x + snd x in
match a with
| h :: t -> ((h + b) / 10) :: (((h + b) mod 10) :: t)
| _ -> [b / 10 ; b mod 10]
LetG NonRec (fromList [BopG EmptyG EmptyG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(22,22)-(22,23)
fst
VarG

(22,22)-(22,23)
fst x
AppG (fromList [VarG])

(22,22)-(22,23)
fst x + snd x
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(24,20)-(25,61)
snd x
AppG (fromList [VarG])

(24,21)-(24,50)
snd
VarG

(24,21)-(24,50)
x
VarG

(24,21)-(24,50)
a
VarG

(24,21)-(24,50)
match a with
| h :: t -> ((h + b) / 10) :: (((h + b) mod 10) :: t)
| _ -> [b / 10 ; b mod 10]
CaseG VarG (fromList [(Nothing,ConAppG (Just EmptyG) Nothing),(Nothing,ListG EmptyG Nothing)])

(24,21)-(24,50)
((h + b) / 10) :: (((h + b) mod 10) :: t)
ConAppG (Just (TupleG (fromList [BopG (BopG VarG VarG) LitG,ConAppG (Just (TupleG (fromList [VarG,BopG (BopG VarG VarG) LitG]))) Nothing]))) Nothing

(24,32)-(24,38)
h
VarG

(25,34)-(25,40)
h
VarG

(26,4)-(28,51)
b
VarG

(26,4)-(28,51)
b
VarG

(26,4)-(28,51)
b / 10
BopG VarG LitG

(26,4)-(28,51)
b mod 10
BopG VarG LitG

(26,4)-(28,51)
10
LitG

(26,4)-(28,51)
10
LitG

(26,4)-(28,51)
[b / 10 ; b mod 10]
ListG (BopG EmptyG EmptyG) Nothing

*)
