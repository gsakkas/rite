
let bigMul l1 l2 =
  let f a x = failwith "to be implemented" in
  let base = failwith "to be implemented" in
  let args =
    let rec argmaker x y =
      match y with | [] -> [] | hd::tl -> List.append (x, hd) (argmaker x tl) in
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
(2,11)-(9,49)
(3,2)-(9,49)
(3,14)-(3,22)
(3,14)-(3,42)
(3,23)-(3,42)
(4,2)-(9,49)
(4,13)-(4,21)
(4,13)-(4,41)
(4,22)-(4,41)
(5,2)-(9,49)
(7,42)-(7,53)
(7,42)-(7,77)
(7,54)-(7,61)
(7,55)-(7,56)
(7,58)-(7,60)
(7,62)-(7,77)
*)

(* type error slice
(7,42)-(7,53)
(7,42)-(7,77)
(7,54)-(7,61)
*)

(* all spans
(2,11)-(9,49)
(2,14)-(9,49)
(3,2)-(9,49)
(3,8)-(3,42)
(3,10)-(3,42)
(3,14)-(3,42)
(3,14)-(3,22)
(3,23)-(3,42)
(4,2)-(9,49)
(4,13)-(4,41)
(4,13)-(4,21)
(4,22)-(4,41)
(5,2)-(9,49)
(6,4)-(8,18)
(6,21)-(7,77)
(6,23)-(7,77)
(7,6)-(7,77)
(7,12)-(7,13)
(7,27)-(7,29)
(7,42)-(7,77)
(7,42)-(7,53)
(7,54)-(7,61)
(7,55)-(7,56)
(7,58)-(7,60)
(7,62)-(7,77)
(7,63)-(7,71)
(7,72)-(7,73)
(7,74)-(7,76)
(8,4)-(8,18)
(8,4)-(8,12)
(8,13)-(8,15)
(8,16)-(8,18)
(9,2)-(9,49)
(9,16)-(9,42)
(9,16)-(9,30)
(9,31)-(9,32)
(9,33)-(9,37)
(9,38)-(9,42)
(9,46)-(9,49)
*)
