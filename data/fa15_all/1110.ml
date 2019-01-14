
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
      match x with
      | h::t ->
          (match h with
           | (fir,sec) ->
               (match a with
                | h::t -> ((fir + sec) + (h / 10)) ::
                    (((fir + sec) + h) mod 10) :: t)) in
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
(18,6)-(24,53)
let b = fst x + snd x in
match a with
| h :: t -> ((h + b) / 10) :: (((h + b) mod 10) :: t)
| _ -> [b / 10 ; b mod 10]
LetG NonRec (fromList [BopG EmptyG EmptyG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(18,12)-(18,13)
fst
VarG

(18,12)-(18,13)
fst x
AppG (fromList [VarG])

(18,12)-(18,13)
fst x + snd x
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(22,15)-(24,52)
snd x
AppG (fromList [VarG])

(22,22)-(22,23)
snd
VarG

(22,22)-(22,23)
x
VarG

(22,22)-(22,23)
match a with
| h :: t -> ((h + b) / 10) :: (((h + b) mod 10) :: t)
| _ -> [b / 10 ; b mod 10]
CaseG VarG (fromList [(Nothing,ConAppG (Just EmptyG) Nothing),(Nothing,ListG EmptyG Nothing)])

(23,42)-(23,43)
h + b
BopG VarG VarG

(23,46)-(23,48)
b
VarG

(24,43)-(24,45)
b
VarG

(25,4)-(27,51)
b
VarG

(25,4)-(27,51)
b
VarG

(25,4)-(27,51)
b / 10
BopG VarG LitG

(25,4)-(27,51)
b mod 10
BopG VarG LitG

(25,4)-(27,51)
10
LitG

(25,4)-(27,51)
10
LitG

(25,4)-(27,51)
[b / 10 ; b mod 10]
ListG (BopG EmptyG EmptyG) Nothing

*)
