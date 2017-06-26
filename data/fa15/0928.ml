
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
(9,14)-(10,72)
(10,2)-(10,72)
(12,11)-(16,49)
(13,14)-(13,22)
(13,14)-(13,42)
(13,23)-(13,42)
(14,2)-(16,49)
(14,14)-(14,15)
(15,2)-(16,49)
(15,13)-(15,28)
(16,2)-(16,49)
*)

(* type error slice
(4,3)-(7,69)
(4,12)-(7,67)
(4,15)-(7,67)
(5,2)-(7,67)
(6,9)-(6,56)
(6,10)-(6,15)
(6,16)-(6,17)
(6,38)-(6,54)
(6,39)-(6,50)
(6,51)-(6,53)
(7,7)-(7,67)
(7,64)-(7,66)
(9,3)-(10,74)
(9,14)-(10,72)
(9,17)-(10,72)
(10,2)-(10,72)
(10,14)-(10,21)
(10,14)-(10,27)
(10,31)-(10,72)
(10,46)-(10,71)
(10,47)-(10,52)
(10,53)-(10,54)
(15,2)-(16,49)
(15,13)-(15,22)
(15,13)-(15,28)
(16,16)-(16,30)
(16,16)-(16,42)
(16,38)-(16,42)
*)

(* all spans
(2,14)-(2,65)
(2,16)-(2,65)
(2,20)-(2,65)
(2,23)-(2,29)
(2,23)-(2,24)
(2,28)-(2,29)
(2,35)-(2,37)
(2,43)-(2,65)
(2,43)-(2,44)
(2,48)-(2,65)
(2,49)-(2,54)
(2,55)-(2,56)
(2,57)-(2,64)
(2,58)-(2,59)
(2,62)-(2,63)
(4,12)-(7,67)
(4,15)-(7,67)
(5,2)-(7,67)
(5,5)-(5,41)
(5,5)-(5,21)
(5,6)-(5,17)
(5,18)-(5,20)
(5,25)-(5,41)
(5,26)-(5,37)
(5,38)-(5,40)
(6,7)-(6,67)
(6,8)-(6,62)
(6,57)-(6,58)
(6,9)-(6,56)
(6,10)-(6,15)
(6,16)-(6,17)
(6,18)-(6,55)
(6,19)-(6,35)
(6,20)-(6,31)
(6,32)-(6,34)
(6,38)-(6,54)
(6,39)-(6,50)
(6,51)-(6,53)
(6,59)-(6,61)
(6,64)-(6,66)
(7,7)-(7,67)
(7,8)-(7,62)
(7,57)-(7,58)
(7,9)-(7,56)
(7,10)-(7,15)
(7,16)-(7,17)
(7,18)-(7,55)
(7,19)-(7,35)
(7,20)-(7,31)
(7,32)-(7,34)
(7,38)-(7,54)
(7,39)-(7,50)
(7,51)-(7,53)
(7,59)-(7,61)
(7,64)-(7,66)
(9,14)-(10,72)
(9,17)-(10,72)
(10,2)-(10,72)
(10,14)-(10,27)
(10,14)-(10,21)
(10,22)-(10,24)
(10,25)-(10,27)
(10,31)-(10,72)
(10,32)-(10,44)
(10,33)-(10,41)
(10,42)-(10,43)
(10,46)-(10,71)
(10,47)-(10,52)
(10,53)-(10,54)
(10,55)-(10,70)
(10,56)-(10,67)
(10,68)-(10,69)
(12,11)-(16,49)
(12,14)-(16,49)
(13,2)-(16,49)
(13,8)-(13,42)
(13,10)-(13,42)
(13,14)-(13,42)
(13,14)-(13,22)
(13,23)-(13,42)
(14,2)-(16,49)
(14,13)-(14,20)
(14,14)-(14,15)
(14,17)-(14,19)
(15,2)-(16,49)
(15,13)-(15,28)
(15,13)-(15,22)
(15,23)-(15,25)
(15,26)-(15,28)
(16,2)-(16,49)
(16,16)-(16,42)
(16,16)-(16,30)
(16,31)-(16,32)
(16,33)-(16,37)
(16,38)-(16,42)
(16,46)-(16,49)
*)
