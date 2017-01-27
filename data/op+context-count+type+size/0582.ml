
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
        let multres = mulByDigit l2digit templ1 in
        (0, (bigAdd (a @ [0]) multres)) in
  let base = (0, []) in
  let args =
    let rec argmaker x y =
      match y with
      | [] -> []
      | hd::tl -> if tl = [] then [(hd, x)] else (hd, x) :: (argmaker x tl) in
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
(54,23)-(54,48)
(55,22)-(55,23)
*)

(* type error slice
(2,4)-(7,26)
(2,15)-(7,23)
(2,17)-(7,23)
(3,3)-(7,23)
(6,24)-(6,35)
(6,24)-(6,46)
(6,36)-(6,38)
(6,40)-(6,46)
(7,3)-(7,14)
(7,3)-(7,23)
(7,15)-(7,16)
(7,18)-(7,21)
(7,18)-(7,23)
(7,22)-(7,23)
(9,4)-(14,79)
(9,13)-(14,76)
(9,16)-(14,76)
(10,3)-(14,76)
(10,10)-(10,21)
(10,10)-(10,24)
(10,22)-(10,24)
(10,29)-(10,40)
(10,29)-(10,43)
(10,41)-(10,43)
(12,8)-(12,10)
(12,8)-(12,75)
(12,13)-(12,24)
(12,13)-(12,75)
(12,26)-(12,31)
(12,26)-(12,69)
(12,32)-(12,33)
(12,36)-(12,69)
(12,73)-(12,75)
(16,4)-(21,15)
(16,20)-(21,13)
(17,3)-(21,13)
(18,5)-(20,57)
(20,32)-(20,40)
(20,32)-(20,43)
(20,41)-(20,43)
(21,3)-(21,11)
(21,3)-(21,13)
(21,12)-(21,13)
(23,4)-(37,37)
(23,12)-(37,33)
(23,15)-(37,33)
(24,3)-(37,33)
(24,12)-(36,52)
(25,5)-(36,52)
(25,11)-(33,49)
(25,13)-(33,49)
(26,7)-(33,49)
(26,13)-(26,14)
(28,11)-(33,49)
(28,27)-(28,52)
(28,33)-(28,34)
(29,11)-(33,49)
(29,29)-(29,49)
(29,29)-(29,61)
(29,29)-(29,67)
(29,41)-(29,49)
(29,53)-(29,61)
(30,11)-(33,49)
(31,12)-(33,49)
(32,30)-(32,39)
(32,30)-(32,70)
(32,42)-(32,70)
(34,5)-(36,52)
(34,17)-(34,18)
(34,17)-(34,22)
(34,20)-(34,22)
(35,5)-(36,52)
(35,16)-(35,24)
(35,16)-(35,44)
(35,26)-(35,38)
(35,26)-(35,44)
(35,39)-(35,41)
(35,42)-(35,44)
(36,5)-(36,52)
(36,19)-(36,33)
(36,19)-(36,45)
(36,34)-(36,35)
(36,36)-(36,40)
(36,41)-(36,45)
(36,49)-(36,52)
(37,3)-(37,13)
(37,3)-(37,33)
(37,15)-(37,18)
(37,15)-(37,33)
(37,20)-(37,27)
(37,20)-(37,33)
(37,28)-(37,30)
(37,31)-(37,33)
(39,4)-(48,18)
(39,20)-(48,16)
(39,22)-(48,16)
(40,3)-(48,16)
(41,3)-(48,16)
(42,5)-(47,41)
(45,13)-(45,19)
(45,18)-(45,19)
(46,58)-(46,67)
(46,58)-(46,72)
(46,68)-(46,69)
(46,70)-(46,72)
(48,3)-(48,12)
(48,3)-(48,16)
(48,13)-(48,14)
(48,15)-(48,16)
(51,3)-(63,50)
(51,9)-(55,38)
(51,11)-(55,38)
(52,5)-(55,38)
(52,11)-(52,12)
(54,9)-(55,38)
(54,23)-(54,33)
(54,23)-(54,48)
(54,34)-(54,41)
(54,42)-(54,48)
(55,10)-(55,11)
(55,10)-(55,38)
(55,14)-(55,20)
(55,14)-(55,38)
(55,22)-(55,23)
(55,22)-(55,29)
(55,24)-(55,25)
(55,26)-(55,29)
(55,27)-(55,28)
(55,31)-(55,38)
(56,3)-(63,50)
(56,15)-(56,16)
(56,15)-(56,20)
(56,18)-(56,20)
(57,3)-(63,50)
(58,5)-(62,19)
(59,7)-(61,75)
(61,62)-(61,70)
(61,62)-(61,75)
(61,71)-(61,72)
(61,73)-(61,75)
(62,5)-(62,13)
(62,5)-(62,19)
(62,14)-(62,16)
(62,17)-(62,19)
(63,17)-(63,31)
(63,17)-(63,43)
(63,32)-(63,33)
(63,34)-(63,38)
(63,39)-(63,43)
*)
