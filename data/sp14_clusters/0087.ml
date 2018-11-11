
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
    let f a x = match x with | [] -> [] | h::t -> [] in
    let base = [] in
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
AppG [VarG]

(16,22)-(16,23)
fst x
AppG [VarG]

(16,22)-(16,23)
fst x + snd x
BopG (AppG [EmptyG]) (AppG [EmptyG])

(16,22)-(16,23)
(fst x + snd x , [(fst x + snd x) / 10 ; (fst x + snd x) mod 10])
TupleG [BopG EmptyG EmptyG,ListG EmptyG Nothing]

(16,37)-(16,39)
snd x
AppG [VarG]

(16,50)-(16,52)
snd
VarG

(16,50)-(16,52)
x
VarG

(16,50)-(16,52)
fst
VarG

(16,50)-(16,52)
x
VarG

(16,50)-(16,52)
snd
VarG

(16,50)-(16,52)
x
VarG

(16,50)-(16,52)
fst
VarG

(16,50)-(16,52)
x
VarG

(16,50)-(16,52)
snd
VarG

(16,50)-(16,52)
x
VarG

(16,50)-(16,52)
fst x
AppG [VarG]

(16,50)-(16,52)
snd x
AppG [VarG]

(16,50)-(16,52)
fst x
AppG [VarG]

(16,50)-(16,52)
snd x
AppG [VarG]

(16,50)-(16,52)
fst x + snd x
BopG (AppG [EmptyG]) (AppG [EmptyG])

(16,50)-(16,52)
(fst x + snd x) / 10
BopG (BopG EmptyG EmptyG) LitG

(16,50)-(16,52)
fst x + snd x
BopG (AppG [EmptyG]) (AppG [EmptyG])

(16,50)-(16,52)
(fst x + snd x) mod 10
BopG (BopG EmptyG EmptyG) LitG

(16,50)-(16,52)
10
LitG

(16,50)-(16,52)
10
LitG

(16,50)-(16,52)
0
LitG

(16,50)-(16,52)
(0 , [])
TupleG [LitG,ListG EmptyG Nothing]

(16,50)-(16,52)
[(fst x + snd x) / 10 ; (fst x + snd x) mod 10]
ListG (BopG EmptyG EmptyG) Nothing

(17,15)-(17,17)
0
LitG

(17,15)-(17,17)
(0 , [])
TupleG [LitG,ListG EmptyG Nothing]

*)
