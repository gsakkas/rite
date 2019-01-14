
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t when h == 0 -> removeZero t | h::t -> h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match x with | (x,y) -> (x + y) :: a in
    let base = [] in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t when h == 0 -> removeZero t | h::t -> h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (w,z) ->
          (match x with
           | (x,y) -> ((((x + y) + w) / 10), ((((x + y) + w) mod 10) :: z))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,4)-(19,51)
a
VarG

(16,4)-(19,51)
match a with
| (w , z) -> match x with
             | (x , y) -> (((x + y) + w) / 10 , (((x + y) + w) mod 10) :: z)
CaseG VarG (fromList [(Nothing,CaseG EmptyG (fromList [(Nothing,EmptyG)]))])

(16,12)-(16,52)
x
VarG

(16,12)-(16,52)
y
VarG

(16,12)-(16,52)
w
VarG

(16,12)-(16,52)
((x + y) + w) / 10
BopG (BopG EmptyG EmptyG) LitG

(16,12)-(16,52)
(x + y) + w
BopG (BopG EmptyG EmptyG) VarG

(16,12)-(16,52)
x + y
BopG VarG VarG

(16,12)-(16,52)
10
LitG

(16,12)-(16,52)
(((x + y) + w) / 10 , (((x + y) + w) mod 10) :: z)
TupleG (fromList [BopG EmptyG EmptyG,ConAppG (Just EmptyG) Nothing])

(16,16)-(16,52)
((x + y) + w) mod 10
BopG (BopG EmptyG EmptyG) LitG

(16,22)-(16,23)
x + y
BopG VarG VarG

(16,41)-(16,42)
z
VarG

(16,41)-(16,42)
10
LitG

(16,45)-(16,46)
0
LitG

(16,45)-(16,46)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(16,51)-(16,52)
w
VarG

*)
