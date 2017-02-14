
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
        let multres = mulByDigit l2digit templ1 in bigAdd (a :: 0) multres in
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
(52,4)-(54,74)
(54,8)-(54,74)
(54,22)-(54,47)
(54,51)-(54,74)
(54,58)-(54,66)
(54,59)-(54,60)
(54,64)-(54,65)
(55,2)-(62,49)
(56,2)-(62,49)
(57,4)-(61,18)
(57,21)-(60,75)
(60,36)-(60,37)
(60,39)-(60,41)
(60,49)-(60,56)
(60,49)-(60,75)
(60,53)-(60,55)
(60,60)-(60,75)
(62,2)-(62,49)
(62,16)-(62,30)
(62,31)-(62,32)
(62,33)-(62,37)
(62,38)-(62,42)
*)

(* type error slice
(2,3)-(7,25)
(2,14)-(7,23)
(2,16)-(7,23)
(3,2)-(7,23)
(6,16)-(6,18)
(6,16)-(6,47)
(6,16)-(6,47)
(6,22)-(6,47)
(6,23)-(6,34)
(6,35)-(6,37)
(7,2)-(7,13)
(7,2)-(7,23)
(7,14)-(7,15)
(9,3)-(14,78)
(9,12)-(14,76)
(12,24)-(12,71)
(12,25)-(12,30)
(12,31)-(12,32)
(14,7)-(14,71)
(14,8)-(14,19)
(14,20)-(14,67)
(14,21)-(14,26)
(14,68)-(14,70)
(16,3)-(21,14)
(16,19)-(21,12)
(17,2)-(21,12)
(20,16)-(20,56)
(20,16)-(20,56)
(20,31)-(20,39)
(20,31)-(20,42)
(20,48)-(20,56)
(21,2)-(21,10)
(21,2)-(21,12)
(23,3)-(37,36)
(23,11)-(37,34)
(23,14)-(37,34)
(24,2)-(37,34)
(37,2)-(37,12)
(37,2)-(37,34)
(37,18)-(37,33)
(37,19)-(37,26)
(37,27)-(37,29)
(51,2)-(62,49)
(51,8)-(54,74)
(51,10)-(54,74)
(52,4)-(54,74)
(54,8)-(54,74)
(54,51)-(54,57)
(54,51)-(54,74)
(54,58)-(54,66)
(54,58)-(54,66)
(54,58)-(54,66)
(54,59)-(54,60)
(54,64)-(54,65)
(62,16)-(62,30)
(62,16)-(62,42)
(62,31)-(62,32)
*)
