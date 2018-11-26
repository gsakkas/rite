
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  let diffsize = (List.length l1) - (List.length l2) in
  if diffsize > 0
  then (l1, (List.append (clone 0 diffsize) l2))
  else ((List.append (clone 0 ((-1) * diffsize)) l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (h1::t1,h2::t2) ->
          ([], (((h1 + h2) / 10) :: ((h1 + h2) mod 10) :: a))
      | _ -> ([], a) in
    let base = [0] in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  let diffsize = (List.length l1) - (List.length l2) in
  if diffsize > 0
  then (l1, (List.append (clone 0 diffsize) l2))
  else ((List.append (clone 0 ((-1) * diffsize)) l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (h1,h2) -> ((h1 + h2) / 10) :: ((h1 + h2) mod 10) :: a
      | _ -> a in
    let base = [] in
    let args = List.combine l1 l2 in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,6)-(19,20)
match x with
| (h1 , h2) -> ((h1 + h2) / 10) :: (((h1 + h2) mod 10) :: a)
| _ -> a
CaseG VarG (fromList [(Nothing,VarG),(Nothing,ConAppG (Just (TupleG (fromList [BopG (BopG VarG VarG) LitG,ConAppG (Just (TupleG (fromList [VarG,BopG (BopG VarG VarG) LitG]))) Nothing]))) Nothing)])

(20,16)-(20,17)
[]
ListG EmptyG Nothing

(22,4)-(22,51)
let res =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) VarG

*)
