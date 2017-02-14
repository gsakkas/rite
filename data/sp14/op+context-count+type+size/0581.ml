
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
(52,5)-(54,75)
(54,9)-(54,75)
(54,23)-(54,48)
(54,52)-(54,75)
(54,60)-(54,61)
(54,60)-(54,66)
(54,65)-(54,66)
(55,3)-(62,50)
(56,3)-(62,50)
(57,5)-(61,19)
(57,22)-(60,75)
(60,37)-(60,38)
(60,40)-(60,42)
(60,51)-(60,56)
(60,51)-(60,75)
(60,54)-(60,56)
(60,62)-(60,75)
(62,3)-(62,50)
(62,17)-(62,31)
(62,32)-(62,33)
(62,34)-(62,38)
(62,39)-(62,43)
*)

(* type error slice
(2,4)-(7,26)
(2,15)-(7,23)
(2,17)-(7,23)
(3,3)-(7,23)
(6,17)-(6,19)
(6,17)-(6,46)
(6,17)-(6,46)
(6,24)-(6,35)
(6,24)-(6,46)
(6,36)-(6,38)
(7,3)-(7,14)
(7,3)-(7,23)
(7,15)-(7,16)
(9,4)-(14,79)
(9,13)-(14,76)
(12,26)-(12,31)
(12,26)-(12,69)
(12,32)-(12,33)
(14,9)-(14,20)
(14,9)-(14,71)
(14,22)-(14,27)
(14,22)-(14,65)
(14,69)-(14,71)
(16,4)-(21,15)
(16,20)-(21,13)
(17,3)-(21,13)
(20,17)-(20,57)
(20,17)-(20,57)
(20,32)-(20,40)
(20,32)-(20,43)
(20,49)-(20,57)
(21,3)-(21,11)
(21,3)-(21,13)
(23,4)-(37,37)
(23,12)-(37,33)
(23,15)-(37,33)
(24,3)-(37,33)
(37,3)-(37,13)
(37,3)-(37,33)
(37,20)-(37,27)
(37,20)-(37,33)
(37,28)-(37,30)
(51,3)-(62,50)
(51,9)-(54,75)
(51,11)-(54,75)
(52,5)-(54,75)
(54,9)-(54,75)
(54,52)-(54,58)
(54,52)-(54,75)
(54,60)-(54,61)
(54,60)-(54,66)
(54,60)-(54,66)
(54,60)-(54,66)
(54,65)-(54,66)
(62,17)-(62,31)
(62,17)-(62,43)
(62,32)-(62,33)
*)
