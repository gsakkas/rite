
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
(5,5)-(5,40)
(6,7)-(6,59)
(7,7)-(7,59)
(9,11)-(15,49)
(10,2)-(15,49)
(10,14)-(10,22)
(10,14)-(10,42)
(10,23)-(10,42)
(11,2)-(15,49)
(11,13)-(11,21)
(11,13)-(11,41)
(11,22)-(11,41)
(12,2)-(15,49)
(13,5)-(13,20)
(13,6)-(13,13)
(13,14)-(13,16)
(13,17)-(13,19)
(14,6)-(14,63)
(14,10)-(14,26)
(14,10)-(14,46)
(14,11)-(14,22)
(14,23)-(14,25)
(14,30)-(14,46)
(14,31)-(14,42)
(14,43)-(14,45)
(14,52)-(14,54)
(15,2)-(15,49)
*)

(* type error slice
(12,2)-(15,49)
(13,4)-(14,64)
(15,16)-(15,30)
(15,16)-(15,42)
(15,38)-(15,42)
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
(4,12)-(7,59)
(4,15)-(7,59)
(5,2)-(7,59)
(5,5)-(5,40)
(5,5)-(5,21)
(5,6)-(5,17)
(5,18)-(5,20)
(5,24)-(5,40)
(5,25)-(5,36)
(5,37)-(5,39)
(6,7)-(6,59)
(6,55)-(6,56)
(6,7)-(6,54)
(6,8)-(6,13)
(6,14)-(6,15)
(6,16)-(6,53)
(6,17)-(6,33)
(6,18)-(6,29)
(6,30)-(6,32)
(6,36)-(6,52)
(6,37)-(6,48)
(6,49)-(6,51)
(6,57)-(6,59)
(7,7)-(7,59)
(7,55)-(7,56)
(7,7)-(7,54)
(7,8)-(7,13)
(7,14)-(7,15)
(7,16)-(7,53)
(7,17)-(7,33)
(7,18)-(7,29)
(7,30)-(7,32)
(7,36)-(7,52)
(7,37)-(7,48)
(7,49)-(7,51)
(7,57)-(7,59)
(9,11)-(15,49)
(9,14)-(15,49)
(10,2)-(15,49)
(10,8)-(10,42)
(10,10)-(10,42)
(10,14)-(10,42)
(10,14)-(10,22)
(10,23)-(10,42)
(11,2)-(15,49)
(11,13)-(11,41)
(11,13)-(11,21)
(11,22)-(11,41)
(12,2)-(15,49)
(13,4)-(14,64)
(13,5)-(13,20)
(13,6)-(13,13)
(13,14)-(13,16)
(13,17)-(13,19)
(14,6)-(14,63)
(14,10)-(14,46)
(14,10)-(14,26)
(14,11)-(14,22)
(14,23)-(14,25)
(14,30)-(14,46)
(14,31)-(14,42)
(14,43)-(14,45)
(14,52)-(14,54)
(14,60)-(14,62)
(15,2)-(15,49)
(15,16)-(15,42)
(15,16)-(15,30)
(15,31)-(15,32)
(15,33)-(15,37)
(15,38)-(15,42)
(15,46)-(15,49)
*)
