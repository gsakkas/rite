
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
    let f a x = ((x / 10), (x mod 10)) :: a in
    let base = [] in
    let args = [] in let (_,res) = List.fold_left f base args in res in
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
(16,16)-(16,38)
snd
VarG

(16,16)-(16,38)
a
VarG

(16,16)-(16,38)
snd a
AppG [VarG]

(16,16)-(16,43)
match snd a with
| [] -> (fst x + snd x , [(fst x + snd x) / 10 ; (fst x + snd x) mod 10])
| h :: t -> (0 , [])
CaseG (AppG [EmptyG]) [(Nothing,TupleG [EmptyG,EmptyG]),(Nothing,TupleG [EmptyG,EmptyG])]

(16,17)-(16,25)
fst
VarG

(16,17)-(16,25)
x
VarG

(16,17)-(16,25)
snd
VarG

(16,17)-(16,25)
x
VarG

(16,17)-(16,25)
fst x
AppG [VarG]

(16,17)-(16,25)
snd x
AppG [VarG]

(16,17)-(16,25)
fst x + snd x
BopG (AppG [EmptyG]) (AppG [EmptyG])

(16,17)-(16,25)
[(fst x + snd x) / 10 ; (fst x + snd x) mod 10]
ListG (BopG EmptyG EmptyG) Nothing

(16,18)-(16,19)
fst
VarG

(16,18)-(16,19)
fst x
AppG [VarG]

(16,18)-(16,19)
fst x + snd x
BopG (AppG [EmptyG]) (AppG [EmptyG])

(16,22)-(16,24)
snd
VarG

(16,22)-(16,24)
x
VarG

(16,22)-(16,24)
snd x
AppG [VarG]

(16,28)-(16,29)
fst
VarG

(16,28)-(16,29)
fst x
AppG [VarG]

(16,28)-(16,29)
fst x + snd x
BopG (AppG [EmptyG]) (AppG [EmptyG])

(16,34)-(16,36)
snd
VarG

(16,34)-(16,36)
x
VarG

(16,34)-(16,36)
snd x
AppG [VarG]

(16,42)-(16,43)
(0 , [])
TupleG [LitG,ListG EmptyG Nothing]

(17,4)-(18,68)
0
LitG

(17,4)-(18,68)
[]
ListG EmptyG Nothing

(17,15)-(17,17)
0
LitG

(17,15)-(17,17)
(0 , [])
TupleG [LitG,ListG EmptyG Nothing]

(18,15)-(18,17)
List.combine (List.rev l1)
             (List.rev l2)
AppG [AppG [EmptyG],AppG [EmptyG]]

(18,21)-(18,68)
List.combine
VarG

(18,21)-(18,68)
List.rev
VarG

(18,21)-(18,68)
l1
VarG

(18,21)-(18,68)
List.rev
VarG

(18,21)-(18,68)
l2
VarG

(18,21)-(18,68)
List.rev l1
AppG [VarG]

(18,21)-(18,68)
List.rev l2
AppG [VarG]

*)
