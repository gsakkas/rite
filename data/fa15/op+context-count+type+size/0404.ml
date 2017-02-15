
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
               (bigAdd total ((mulByDigit a wholeNum) @ zeros)))) in
  let base = ([], []) in
  let args = let (x,y) = makeTuple l1 l2 in List.combine x y in
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
(46,42)-(46,43)
*)

(* type error slice
(4,3)-(7,69)
(4,12)-(7,67)
(4,15)-(7,67)
(5,2)-(7,67)
(6,7)-(6,67)
(6,9)-(6,56)
(6,10)-(6,15)
(6,16)-(6,17)
(6,64)-(6,66)
(7,38)-(7,54)
(7,39)-(7,50)
(7,51)-(7,53)
(34,2)-(34,72)
(34,14)-(34,21)
(34,14)-(34,27)
(34,46)-(34,71)
(34,47)-(34,52)
(34,53)-(34,54)
(37,33)-(37,55)
(37,34)-(37,44)
(37,45)-(37,52)
(40,2)-(49,49)
(40,8)-(46,65)
(40,10)-(46,65)
(41,4)-(46,65)
(43,8)-(46,65)
(43,8)-(46,65)
(43,15)-(43,16)
(45,13)-(46,64)
(46,30)-(46,53)
(46,31)-(46,41)
(46,42)-(46,43)
(49,16)-(49,30)
(49,16)-(49,42)
(49,31)-(49,32)
*)
