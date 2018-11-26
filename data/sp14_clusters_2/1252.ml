
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let dl = (List.length l1) - (List.length l2) in
  match dl with
  | 0 -> (l1, l2)
  | _ ->
      if dl > 0
      then (l1, ((clone 0 dl) @ l2))
      else (((clone 0 (dl / (-1))) @ l1), l2);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let z = (fst x) + (snd x) in
      match a with | (w,y) -> (((w + z) / 10), (((w + z) mod 10) :: y)) in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  add (padZero l1 l2);;


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

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let z = (fst x) + (snd x) in
      match a with
      | (w,[]) -> (w, [z / 10; z mod 10])
      | (w,h::t) -> (((w + z) / 10), (((w + z) mod 10) :: t)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  add (padZero l1 l2);;

*)

(* changed spans
(17,6)-(17,71)
match a with
| (w , []) -> (w , [z / 10 ; z mod 10])
| (w , h :: t) -> ((w + z) / 10 , ((w + z) mod 10) :: t)
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(17,31)-(17,45)
w
VarG

(17,31)-(17,45)
[z / 10 ; z mod 10]
ListG (BopG EmptyG EmptyG) Nothing

(17,32)-(17,39)
z
VarG

(17,32)-(17,39)
z
VarG

(17,32)-(17,39)
z mod 10
BopG VarG LitG

(17,32)-(17,39)
(w + z) / 10
BopG (BopG EmptyG EmptyG) LitG

(17,32)-(17,39)
10
LitG

(17,32)-(17,39)
10
LitG

(17,32)-(17,39)
((w + z) / 10 , ((w + z) mod 10) :: t)
TupleG (fromList [BopG EmptyG EmptyG,ConAppG (Just EmptyG) Nothing])

(17,68)-(17,69)
t
VarG

(18,15)-(18,17)
0
LitG

(18,15)-(18,17)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

*)
