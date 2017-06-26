
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
(6,9)-(6,56)
(6,10)-(6,15)
(6,16)-(6,17)
(6,38)-(6,54)
(6,39)-(6,50)
(6,51)-(6,53)
(7,7)-(7,67)
(7,64)-(7,66)
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
(43,15)-(43,16)
(45,13)-(46,64)
(46,30)-(46,53)
(46,31)-(46,41)
(46,42)-(46,43)
(49,16)-(49,30)
(49,16)-(49,42)
(49,31)-(49,32)
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
(9,19)-(12,42)
(10,2)-(12,42)
(10,8)-(11,72)
(10,10)-(11,72)
(11,4)-(11,72)
(11,7)-(11,26)
(11,7)-(11,22)
(11,8)-(11,19)
(11,20)-(11,21)
(11,25)-(11,26)
(11,32)-(11,59)
(11,36)-(11,41)
(11,36)-(11,37)
(11,40)-(11,41)
(11,47)-(11,49)
(11,55)-(11,58)
(11,56)-(11,57)
(11,65)-(11,72)
(11,67)-(11,68)
(11,65)-(11,66)
(11,69)-(11,72)
(11,70)-(11,71)
(12,2)-(12,42)
(12,13)-(12,15)
(12,19)-(12,42)
(12,19)-(12,33)
(12,34)-(12,35)
(12,36)-(12,40)
(12,41)-(12,42)
(14,11)-(31,34)
(14,14)-(31,34)
(15,2)-(31,34)
(15,11)-(30,51)
(16,4)-(30,51)
(16,10)-(27,58)
(16,12)-(27,58)
(17,6)-(27,58)
(17,12)-(17,13)
(19,10)-(27,58)
(19,17)-(19,18)
(21,15)-(27,57)
(21,25)-(21,44)
(21,25)-(21,36)
(21,26)-(21,29)
(21,32)-(21,35)
(21,39)-(21,44)
(22,15)-(27,57)
(22,18)-(22,26)
(22,18)-(22,21)
(22,24)-(22,26)
(23,20)-(23,39)
(23,21)-(23,22)
(23,24)-(23,38)
(23,31)-(23,32)
(23,25)-(23,30)
(23,26)-(23,29)
(23,33)-(23,37)
(25,17)-(27,57)
(25,20)-(25,28)
(25,20)-(25,23)
(25,26)-(25,28)
(26,22)-(26,39)
(26,23)-(26,24)
(26,26)-(26,38)
(26,31)-(26,32)
(26,27)-(26,30)
(26,28)-(26,29)
(26,33)-(26,37)
(27,22)-(27,57)
(27,23)-(27,33)
(27,24)-(27,27)
(27,30)-(27,32)
(27,35)-(27,56)
(27,49)-(27,50)
(27,36)-(27,48)
(27,37)-(27,47)
(27,37)-(27,40)
(27,45)-(27,47)
(27,51)-(27,55)
(28,4)-(30,51)
(28,15)-(28,22)
(28,16)-(28,17)
(28,19)-(28,21)
(29,4)-(30,51)
(29,15)-(29,71)
(29,15)-(29,27)
(29,28)-(29,49)
(29,29)-(29,37)
(29,38)-(29,48)
(29,43)-(29,44)
(29,39)-(29,42)
(29,40)-(29,41)
(29,45)-(29,47)
(29,50)-(29,71)
(29,51)-(29,59)
(29,60)-(29,70)
(29,65)-(29,66)
(29,61)-(29,64)
(29,62)-(29,63)
(29,67)-(29,69)
(30,4)-(30,51)
(30,18)-(30,44)
(30,18)-(30,32)
(30,33)-(30,34)
(30,35)-(30,39)
(30,40)-(30,44)
(30,48)-(30,51)
(31,2)-(31,34)
(31,2)-(31,12)
(31,13)-(31,34)
(31,14)-(31,17)
(31,18)-(31,33)
(31,19)-(31,26)
(31,27)-(31,29)
(31,30)-(31,32)
(33,14)-(34,72)
(33,17)-(34,72)
(34,2)-(34,72)
(34,14)-(34,27)
(34,14)-(34,21)
(34,22)-(34,24)
(34,25)-(34,27)
(34,31)-(34,72)
(34,32)-(34,44)
(34,33)-(34,41)
(34,42)-(34,43)
(34,46)-(34,71)
(34,47)-(34,52)
(34,53)-(34,54)
(34,55)-(34,70)
(34,56)-(34,67)
(34,68)-(34,69)
(36,19)-(37,55)
(36,21)-(37,55)
(37,2)-(37,55)
(37,5)-(37,10)
(37,5)-(37,6)
(37,9)-(37,10)
(37,16)-(37,18)
(37,24)-(37,55)
(37,24)-(37,30)
(37,31)-(37,32)
(37,33)-(37,55)
(37,34)-(37,44)
(37,45)-(37,52)
(37,46)-(37,47)
(37,50)-(37,51)
(37,53)-(37,54)
(39,11)-(49,49)
(39,14)-(49,49)
(40,2)-(49,49)
(40,8)-(46,65)
(40,10)-(46,65)
(41,4)-(46,65)
(41,10)-(41,11)
(43,8)-(46,65)
(43,15)-(43,16)
(45,13)-(46,64)
(45,14)-(45,27)
(45,21)-(45,22)
(45,15)-(45,20)
(45,23)-(45,26)
(45,24)-(45,25)
(46,15)-(46,63)
(46,16)-(46,22)
(46,23)-(46,28)
(46,29)-(46,62)
(46,54)-(46,55)
(46,30)-(46,53)
(46,31)-(46,41)
(46,42)-(46,43)
(46,44)-(46,52)
(46,56)-(46,61)
(47,2)-(49,49)
(47,13)-(47,21)
(47,14)-(47,16)
(47,18)-(47,20)
(48,2)-(49,49)
(48,13)-(48,60)
(48,25)-(48,40)
(48,25)-(48,34)
(48,35)-(48,37)
(48,38)-(48,40)
(48,44)-(48,60)
(48,44)-(48,56)
(48,57)-(48,58)
(48,59)-(48,60)
(49,2)-(49,49)
(49,16)-(49,42)
(49,16)-(49,30)
(49,31)-(49,32)
(49,33)-(49,37)
(49,38)-(49,42)
(49,46)-(49,49)
*)
