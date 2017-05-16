
let bigMul l1 l2 =
  let f a x = l1 in
  let base = (0, []) in
  let args =
    let rec argmaker x y =
      match y with
      | [] -> (x, [])
      | hd::tl -> List.append (x, hd) (argmaker x tl) in
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
(2,11)-(11,49)
(3,2)-(11,49)
(3,14)-(3,16)
(4,2)-(11,49)
(8,14)-(8,21)
(8,15)-(8,16)
(9,18)-(9,29)
(9,18)-(9,53)
(9,30)-(9,37)
(9,31)-(9,32)
(9,34)-(9,36)
(9,38)-(9,53)
*)

(* type error slice
(6,4)-(10,18)
(6,21)-(9,53)
(6,23)-(9,53)
(7,6)-(9,53)
(8,14)-(8,21)
(9,18)-(9,29)
(9,18)-(9,53)
(9,30)-(9,37)
(9,38)-(9,53)
(9,39)-(9,47)
*)

(* all spans
(2,11)-(11,49)
(2,14)-(11,49)
(3,2)-(11,49)
(3,8)-(3,16)
(3,10)-(3,16)
(3,14)-(3,16)
(4,2)-(11,49)
(4,13)-(4,20)
(4,14)-(4,15)
(4,17)-(4,19)
(5,2)-(11,49)
(6,4)-(10,18)
(6,21)-(9,53)
(6,23)-(9,53)
(7,6)-(9,53)
(7,12)-(7,13)
(8,14)-(8,21)
(8,15)-(8,16)
(8,18)-(8,20)
(9,18)-(9,53)
(9,18)-(9,29)
(9,30)-(9,37)
(9,31)-(9,32)
(9,34)-(9,36)
(9,38)-(9,53)
(9,39)-(9,47)
(9,48)-(9,49)
(9,50)-(9,52)
(10,4)-(10,18)
(10,4)-(10,12)
(10,13)-(10,15)
(10,16)-(10,18)
(11,2)-(11,49)
(11,16)-(11,42)
(11,16)-(11,30)
(11,31)-(11,32)
(11,33)-(11,37)
(11,38)-(11,42)
(11,46)-(11,49)
*)
