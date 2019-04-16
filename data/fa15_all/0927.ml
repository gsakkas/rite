
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (clone 0 ((List.length l2) - (List.length l1))) @ l1
  else (clone 0 ((List.length l1) - (List.length l2))) @ l2;;

let bigMul l1 l2 =
  let f a x = failwith "to be implemented" in
  let base = failwith "to be implemented" in
  let args =
    ((padZero l1 l2),
      (if (List.length l1) >= (List.length l2) then l1 else l2)) in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) <= (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (((clone 0 ((List.length l1) - (List.length l2))) @ l2), l1);;

let rec removeZero l =
  let f a x =
    if (List.length a) = 0 then (if x = 0 then [] else [x]) else a @ [x] in
  let base = [] in List.fold_left f base l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (l1e,l2e) ->
          (match a with
           | (carry,list) ->
               let num = (l1e + l2e) + carry in
               if num < 10
               then (0, ([num] @ list))
               else
                 if num = 10
                 then (1, ([0] @ list))
                 else ((num / 10), ([num mod 10] @ list))) in
    let base = (0, []) in
    let args = List.combine (List.rev ([0] @ l1)) (List.rev ([0] @ l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let makeTuple l1 l2 =
  let (x,y) = padZero l1 l2 in ((List.rev x), (clone y (List.length y)));;

let rec mulByDigit i l =
  if i < 1 then [] else bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    match x with
    | (aNum,wholeNum) ->
        (match a with
         | (zeros,total) ->
             ((zeros @ [0]),
               (bigAdd total ((mulByDigit aNum wholeNum) @ zeros)))) in
  let base = ([], []) in
  let args = let (x,y) = makeTuple l1 l2 in List.combine x y in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(5,6)-(5,41)
List.length l1 <= List.length l2
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(6,8)-(6,60)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(7,8)-(7,60)
(clone 0
       (List.length l1 - List.length l2) @ l2 , l1)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(10,15)-(10,43)
match x with
| (aNum , wholeNum) -> match a with
                       | (zeros , total) -> (zeros @ [0] , bigAdd total
                                                                  (mulByDigit aNum
                                                                              wholeNum @ zeros))
CaseG VarG (fromList [(TuplePatG (fromList [VarPatG]),Nothing,CaseG EmptyG (fromList [(TuplePatG (fromList [EmptyPatG]),Nothing,EmptyG)]))])

(11,14)-(11,42)
([] , [])
TupleG (fromList [ListG (fromList [])])

(13,5)-(14,65)
let (x , y) =
  makeTuple l1 l2 in
List.combine x y
LetG NonRec (fromList [(TuplePatG (fromList [VarPatG]),AppG (fromList [EmptyG]))]) (AppG (fromList [EmptyG]))

*)

(* type error slice
(12,3)-(15,50)
(13,5)-(14,65)
(15,17)-(15,31)
(15,17)-(15,43)
(15,39)-(15,43)
*)
