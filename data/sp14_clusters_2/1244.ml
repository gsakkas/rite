
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
      match a with
      | h::t -> ((h + z) / 10) :: ((h + z) mod 10) :: t
      | _ -> [z / 10; z mod 10] in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in
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
(20,6)-(22,31)
match a with
| (w , y) -> ((w + z) / 10 , ((w + z) mod 10) :: y)
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(21,16)-(21,55)
((w + z) / 10 , ((w + z) mod 10) :: y)
TupleG (fromList [BopG EmptyG EmptyG,ConAppG (Just EmptyG) Nothing])

(21,18)-(21,19)
w
VarG

(22,22)-(22,30)
w
VarG

(23,4)-(25,51)
y
VarG

(23,15)-(23,17)
0
LitG

(23,15)-(23,17)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

*)
