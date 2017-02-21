
let rec clone x n =
  let rec helper xs sub depth =
    match depth > 0 with
    | false  -> xs
    | true  -> helper (sub :: xs) sub (depth - 1) in
  helper [] x n;;

let rec padZero l1 l2 =
  let sizeDif = (List.length l1) - (List.length l2) in
  let appendS = clone 0 (abs sizeDif) in
  if sizeDif < 0 then ((appendS @ l1), l2) else (l1, (appendS @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (op1,op2) ->
          let res = op1 + op2 in
          let (p1,p2) = a in
          (match p2 with
           | [] -> [res / 10; res mod 10]
           | a::b ->
               let re = a + (res mod 10) in (re / 10) :: (re mod 10) :: b) in
    let base = ([], []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let rec helper xs sub depth =
    match depth > 0 with
    | false  -> xs
    | true  -> helper (sub :: xs) sub (depth - 1) in
  helper [] x n;;

let rec padZero l1 l2 =
  let sizeDif = (List.length l1) - (List.length l2) in
  let appendS = clone 0 (abs sizeDif) in
  if sizeDif < 0 then ((appendS @ l1), l2) else (l1, (appendS @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (op1,op2) ->
          let res = op1 + op2 in
          let (p1,p2) = a in
          (match p2 with
           | [] -> (p1, [res / 10; res mod 10])
           | a::b ->
               let re = a + (res mod 10) in
               (p1, ((re / 10) :: (re mod 10) :: b))) in
    let base = ([], []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(25,19)-(25,41)
(27,44)-(27,73)
(28,4)-(30,51)
(29,4)-(30,51)
(30,4)-(30,51)
(31,19)-(31,26)
(31,27)-(31,29)
(31,30)-(31,32)
*)

(* type error slice
(19,4)-(30,51)
(19,10)-(27,74)
(19,12)-(27,74)
(20,6)-(27,74)
(22,10)-(27,74)
(23,10)-(27,74)
(23,10)-(27,74)
(23,24)-(23,25)
(24,10)-(27,74)
(25,19)-(25,41)
(30,18)-(30,32)
(30,18)-(30,44)
(30,33)-(30,34)
*)

(* all spans
(2,14)-(7,15)
(2,16)-(7,15)
(3,2)-(7,15)
(3,17)-(6,49)
(3,20)-(6,49)
(3,24)-(6,49)
(4,4)-(6,49)
(4,10)-(4,19)
(4,10)-(4,15)
(4,18)-(4,19)
(5,16)-(5,18)
(6,15)-(6,49)
(6,15)-(6,21)
(6,22)-(6,33)
(6,23)-(6,26)
(6,30)-(6,32)
(6,34)-(6,37)
(6,38)-(6,49)
(6,39)-(6,44)
(6,47)-(6,48)
(7,2)-(7,15)
(7,2)-(7,8)
(7,9)-(7,11)
(7,12)-(7,13)
(7,14)-(7,15)
(9,16)-(12,68)
(9,19)-(12,68)
(10,2)-(12,68)
(10,16)-(10,51)
(10,16)-(10,32)
(10,17)-(10,28)
(10,29)-(10,31)
(10,35)-(10,51)
(10,36)-(10,47)
(10,48)-(10,50)
(11,2)-(12,68)
(11,16)-(11,37)
(11,16)-(11,21)
(11,22)-(11,23)
(11,24)-(11,37)
(11,25)-(11,28)
(11,29)-(11,36)
(12,2)-(12,68)
(12,5)-(12,16)
(12,5)-(12,12)
(12,15)-(12,16)
(12,22)-(12,42)
(12,23)-(12,37)
(12,32)-(12,33)
(12,24)-(12,31)
(12,34)-(12,36)
(12,39)-(12,41)
(12,48)-(12,68)
(12,49)-(12,51)
(12,53)-(12,67)
(12,62)-(12,63)
(12,54)-(12,61)
(12,64)-(12,66)
(14,19)-(15,69)
(15,2)-(15,69)
(15,8)-(15,9)
(15,23)-(15,25)
(15,36)-(15,69)
(15,39)-(15,44)
(15,39)-(15,40)
(15,43)-(15,44)
(15,50)-(15,62)
(15,50)-(15,60)
(15,61)-(15,62)
(15,68)-(15,69)
(17,11)-(31,34)
(17,14)-(31,34)
(18,2)-(31,34)
(18,11)-(30,51)
(19,4)-(30,51)
(19,10)-(27,74)
(19,12)-(27,74)
(20,6)-(27,74)
(20,12)-(20,13)
(22,10)-(27,74)
(22,20)-(22,29)
(22,20)-(22,23)
(22,26)-(22,29)
(23,10)-(27,74)
(23,24)-(23,25)
(24,10)-(27,74)
(24,17)-(24,19)
(25,19)-(25,41)
(25,20)-(25,28)
(25,20)-(25,23)
(25,26)-(25,28)
(25,30)-(25,40)
(25,30)-(25,33)
(25,38)-(25,40)
(27,15)-(27,73)
(27,24)-(27,40)
(27,24)-(27,25)
(27,28)-(27,40)
(27,29)-(27,32)
(27,37)-(27,39)
(27,44)-(27,73)
(27,44)-(27,53)
(27,45)-(27,47)
(27,50)-(27,52)
(27,57)-(27,73)
(27,57)-(27,68)
(27,58)-(27,60)
(27,65)-(27,67)
(27,72)-(27,73)
(28,4)-(30,51)
(28,15)-(28,23)
(28,16)-(28,18)
(28,20)-(28,22)
(29,4)-(30,51)
(29,15)-(29,55)
(29,15)-(29,27)
(29,28)-(29,41)
(29,29)-(29,37)
(29,38)-(29,40)
(29,42)-(29,55)
(29,43)-(29,51)
(29,52)-(29,54)
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
*)