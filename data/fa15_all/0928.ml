
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) <= (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (((clone 0 ((List.length l1) - (List.length l2))) @ l2), l1);;

let makeTuple l1 l2 =
  let (x,y) = padZero l1 l2 in ((List.rev x), (clone y (List.length y)));;

let bigMul l1 l2 =
  let f a x = failwith "to be implemented" in
  let base = (1, []) in
  let args = makeTuple l1 l2 in
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
(13,15)-(13,43)
match x with
| (aNum , wholeNum) -> match a with
                       | (zeros , total) -> (zeros @ [0] , bigAdd total
                                                                  (mulByDigit aNum
                                                                              wholeNum @ zeros))
CaseG VarG [(TuplePatG (fromList [EmptyPatG]),Nothing,CaseG EmptyG [(EmptyPatG,Nothing,EmptyG)])]

(14,15)-(14,16)
[]
ListG []

(15,14)-(15,29)
let (x , y) =
  makeTuple l1 l2 in
List.combine x y
LetG NonRec [(TuplePatG (fromList [EmptyPatG]),AppG [EmptyG,EmptyG])] (AppG [EmptyG,EmptyG])

*)

(* type error slice
(4,4)-(7,70)
(4,13)-(7,68)
(4,16)-(7,68)
(5,3)-(7,68)
(6,10)-(6,57)
(6,11)-(6,16)
(6,17)-(6,18)
(6,39)-(6,55)
(6,40)-(6,51)
(6,52)-(6,54)
(7,8)-(7,68)
(7,65)-(7,67)
(9,4)-(10,75)
(9,15)-(10,73)
(9,18)-(10,73)
(10,3)-(10,73)
(10,15)-(10,22)
(10,15)-(10,28)
(10,32)-(10,73)
(10,47)-(10,72)
(10,48)-(10,53)
(10,54)-(10,55)
(15,3)-(16,50)
(15,14)-(15,23)
(15,14)-(15,29)
(16,17)-(16,31)
(16,17)-(16,43)
(16,39)-(16,43)
*)
