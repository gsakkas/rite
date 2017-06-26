
let rec clone x n =
  let rec clonehelper tx tn =
    match tn = 0 with
    | true  -> []
    | false  -> tx :: (clonehelper tx (tn - 1)) in
  clonehelper x (abs n);;

let padZero l1 l2 =
  match (List.length l1) > (List.length l2) with
  | true  ->
      (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  | false  ->
      ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l =
  let rec removeZH templ =
    match templ with
    | [] -> []
    | hd::tl -> if hd = 0 then removeZH tl else hd :: tl in
  removeZH l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (addend_a,addend_b) ->
          let prevcarry = match a with | (x,y) -> x in
          let new_carry = ((prevcarry + addend_a) + addend_b) / 10 in
          let digit = ((prevcarry + addend_a) + addend_b) mod 10 in
          (match a with
           | (x,c::d::y) -> (new_carry, (new_carry :: digit :: d :: y))
           | _ -> (new_carry, [new_carry; digit])) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let comb a b = match b with | [] -> [a] | hd::tl -> List.append [a + hd] tl in
  let rec mBDhelper i x =
    match x with
    | [] -> []
    | hd::tl ->
        if (hd * i) > 9
        then ((hd * i) / 10) :: (comb ((hd * i) mod 10) (mBDhelper i tl))
        else (hd * i) :: (mBDhelper i tl) in
  mBDhelper i l;;

let bigMul l1 l2 =
  let f a x =
    match x with
    | (templ1,l2digit) ->
        let multres = mulByDigit l2digit templ1 in
        (0, (bigAdd [a; 0] multres)) in
  let base = (0, []) in
  let args =
    let rec argmaker x y =
      match y with
      | [] -> []
      | hd::tl -> if tl = [] then [(x, hd)] else (x, hd) :: (argmaker x tl) in
    argmaker l1 l2 in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n =
  let rec clonehelper tx tn =
    match tn = 0 with
    | true  -> []
    | false  -> tx :: (clonehelper tx (tn - 1)) in
  clonehelper x (abs n);;

let padZero l1 l2 =
  match (List.length l1) > (List.length l2) with
  | true  ->
      (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  | false  ->
      ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l =
  let rec removeZH templ =
    match templ with
    | [] -> []
    | hd::tl -> if hd = 0 then removeZH tl else hd :: tl in
  removeZH l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (addend_a,addend_b) ->
          let prevcarry = match a with | (x,y) -> x in
          let new_carry = ((prevcarry + addend_a) + addend_b) / 10 in
          let digit = ((prevcarry + addend_a) + addend_b) mod 10 in
          (match a with
           | (x,c::d::y) -> (new_carry, (new_carry :: digit :: d :: y))
           | _ -> (new_carry, [new_carry; digit])) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let comb a b = match b with | [] -> [a] | hd::tl -> List.append [a + hd] tl in
  let rec mBDhelper i x =
    match x with
    | [] -> []
    | hd::tl ->
        if (hd * i) > 9
        then ((hd * i) / 10) :: (comb ((hd * i) mod 10) (mBDhelper i tl))
        else (hd * i) :: (mBDhelper i tl) in
  mBDhelper i l;;

let bigMul l1 l2 =
  let f a x =
    match x with
    | (l2digit,templ1) ->
        let (l2digit2,templ12) = a in
        let multres = mulByDigit l2digit templ1 in
        (0, (bigAdd (templ12 @ [0]) multres)) in
  let base = (0, []) in
  let args =
    let rec argmaker x y =
      match y with
      | [] -> []
      | hd::tl -> if tl = [] then [(hd, x)] else (hd, x) :: (argmaker x tl) in
    argmaker l1 l2 in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(52,4)-(55,36)
(54,8)-(55,36)
(55,20)-(55,26)
(55,21)-(55,22)
(55,24)-(55,25)
(61,36)-(61,37)
(61,49)-(61,75)
(61,50)-(61,51)
(61,60)-(61,75)
*)

(* type error slice
(51,2)-(63,49)
(51,8)-(55,36)
(51,10)-(55,36)
(52,4)-(55,36)
(54,8)-(55,36)
(55,8)-(55,36)
(55,20)-(55,26)
(55,21)-(55,22)
(55,24)-(55,25)
(63,16)-(63,30)
(63,16)-(63,42)
(63,31)-(63,32)
*)

(* all spans
(2,14)-(7,23)
(2,16)-(7,23)
(3,2)-(7,23)
(3,22)-(6,47)
(3,25)-(6,47)
(4,4)-(6,47)
(4,10)-(4,16)
(4,10)-(4,12)
(4,15)-(4,16)
(5,15)-(5,17)
(6,16)-(6,47)
(6,16)-(6,18)
(6,22)-(6,47)
(6,23)-(6,34)
(6,35)-(6,37)
(6,38)-(6,46)
(6,39)-(6,41)
(6,44)-(6,45)
(7,2)-(7,23)
(7,2)-(7,13)
(7,14)-(7,15)
(7,16)-(7,23)
(7,17)-(7,20)
(7,21)-(7,22)
(9,12)-(14,76)
(9,15)-(14,76)
(10,2)-(14,76)
(10,8)-(10,43)
(10,8)-(10,24)
(10,9)-(10,20)
(10,21)-(10,23)
(10,27)-(10,43)
(10,28)-(10,39)
(10,40)-(10,42)
(12,6)-(12,76)
(12,7)-(12,9)
(12,11)-(12,75)
(12,12)-(12,23)
(12,24)-(12,71)
(12,25)-(12,30)
(12,31)-(12,32)
(12,33)-(12,70)
(12,34)-(12,50)
(12,35)-(12,46)
(12,47)-(12,49)
(12,53)-(12,69)
(12,54)-(12,65)
(12,66)-(12,68)
(12,72)-(12,74)
(14,6)-(14,76)
(14,7)-(14,71)
(14,8)-(14,19)
(14,20)-(14,67)
(14,21)-(14,26)
(14,27)-(14,28)
(14,29)-(14,66)
(14,30)-(14,46)
(14,31)-(14,42)
(14,43)-(14,45)
(14,49)-(14,65)
(14,50)-(14,61)
(14,62)-(14,64)
(14,68)-(14,70)
(14,73)-(14,75)
(16,19)-(21,12)
(17,2)-(21,12)
(17,19)-(20,56)
(18,4)-(20,56)
(18,10)-(18,15)
(19,12)-(19,14)
(20,16)-(20,56)
(20,19)-(20,25)
(20,19)-(20,21)
(20,24)-(20,25)
(20,31)-(20,42)
(20,31)-(20,39)
(20,40)-(20,42)
(20,48)-(20,56)
(20,48)-(20,50)
(20,54)-(20,56)
(21,2)-(21,12)
(21,2)-(21,10)
(21,11)-(21,12)
(23,11)-(37,34)
(23,14)-(37,34)
(24,2)-(37,34)
(24,11)-(36,51)
(25,4)-(36,51)
(25,10)-(33,50)
(25,12)-(33,50)
(26,6)-(33,50)
(26,12)-(26,13)
(28,10)-(33,50)
(28,26)-(28,51)
(28,32)-(28,33)
(28,50)-(28,51)
(29,10)-(33,50)
(29,26)-(29,66)
(29,26)-(29,61)
(29,27)-(29,49)
(29,28)-(29,37)
(29,40)-(29,48)
(29,52)-(29,60)
(29,64)-(29,66)
(30,10)-(33,50)
(30,22)-(30,64)
(30,22)-(30,57)
(30,23)-(30,45)
(30,24)-(30,33)
(30,36)-(30,44)
(30,48)-(30,56)
(30,62)-(30,64)
(31,10)-(33,50)
(31,17)-(31,18)
(32,28)-(32,71)
(32,29)-(32,38)
(32,40)-(32,70)
(32,41)-(32,50)
(32,54)-(32,69)
(32,54)-(32,59)
(32,63)-(32,69)
(32,63)-(32,64)
(32,68)-(32,69)
(33,18)-(33,49)
(33,19)-(33,28)
(33,30)-(33,48)
(33,31)-(33,40)
(33,42)-(33,47)
(34,4)-(36,51)
(34,15)-(34,22)
(34,16)-(34,17)
(34,19)-(34,21)
(35,4)-(36,51)
(35,15)-(35,44)
(35,15)-(35,23)
(35,24)-(35,44)
(35,25)-(35,37)
(35,38)-(35,40)
(35,41)-(35,43)
(36,4)-(36,51)
(36,18)-(36,44)
(36,18)-(36,32)
(36,33)-(36,34)
(36,35)-(36,39)
(36,40)-(36,44)
(36,48)-(36,51)
(37,2)-(37,34)
(37,2)-(37,12)
(37,13)-(37,34)
(37,14)-(37,17)
(37,18)-(37,33)
(37,19)-(37,26)
(37,27)-(37,29)
(37,30)-(37,32)
(39,19)-(48,15)
(39,21)-(48,15)
(40,2)-(48,15)
(40,11)-(40,77)
(40,13)-(40,77)
(40,17)-(40,77)
(40,23)-(40,24)
(40,38)-(40,41)
(40,39)-(40,40)
(40,54)-(40,77)
(40,54)-(40,65)
(40,66)-(40,74)
(40,67)-(40,73)
(40,67)-(40,68)
(40,71)-(40,73)
(40,75)-(40,77)
(41,2)-(48,15)
(41,20)-(47,41)
(41,22)-(47,41)
(42,4)-(47,41)
(42,10)-(42,11)
(43,12)-(43,14)
(45,8)-(47,41)
(45,11)-(45,23)
(45,11)-(45,19)
(45,12)-(45,14)
(45,17)-(45,18)
(45,22)-(45,23)
(46,13)-(46,73)
(46,13)-(46,28)
(46,14)-(46,22)
(46,15)-(46,17)
(46,20)-(46,21)
(46,25)-(46,27)
(46,32)-(46,73)
(46,33)-(46,37)
(46,38)-(46,55)
(46,39)-(46,47)
(46,40)-(46,42)
(46,45)-(46,46)
(46,52)-(46,54)
(46,56)-(46,72)
(46,57)-(46,66)
(46,67)-(46,68)
(46,69)-(46,71)
(47,13)-(47,41)
(47,13)-(47,21)
(47,14)-(47,16)
(47,19)-(47,20)
(47,25)-(47,41)
(47,26)-(47,35)
(47,36)-(47,37)
(47,38)-(47,40)
(48,2)-(48,15)
(48,2)-(48,11)
(48,12)-(48,13)
(48,14)-(48,15)
(50,11)-(63,49)
(50,14)-(63,49)
(51,2)-(63,49)
(51,8)-(55,36)
(51,10)-(55,36)
(52,4)-(55,36)
(52,10)-(52,11)
(54,8)-(55,36)
(54,22)-(54,47)
(54,22)-(54,32)
(54,33)-(54,40)
(54,41)-(54,47)
(55,8)-(55,36)
(55,9)-(55,10)
(55,12)-(55,35)
(55,13)-(55,19)
(55,20)-(55,26)
(55,21)-(55,22)
(55,24)-(55,25)
(55,27)-(55,34)
(56,2)-(63,49)
(56,13)-(56,20)
(56,14)-(56,15)
(56,17)-(56,19)
(57,2)-(63,49)
(58,4)-(62,18)
(58,21)-(61,75)
(58,23)-(61,75)
(59,6)-(61,75)
(59,12)-(59,13)
(60,14)-(60,16)
(61,18)-(61,75)
(61,21)-(61,28)
(61,21)-(61,23)
(61,26)-(61,28)
(61,34)-(61,43)
(61,35)-(61,42)
(61,36)-(61,37)
(61,39)-(61,41)
(61,49)-(61,75)
(61,49)-(61,56)
(61,50)-(61,51)
(61,53)-(61,55)
(61,60)-(61,75)
(61,61)-(61,69)
(61,70)-(61,71)
(61,72)-(61,74)
(62,4)-(62,18)
(62,4)-(62,12)
(62,13)-(62,15)
(62,16)-(62,18)
(63,2)-(63,49)
(63,16)-(63,42)
(63,16)-(63,30)
(63,31)-(63,32)
(63,33)-(63,37)
(63,38)-(63,42)
(63,46)-(63,49)
*)
