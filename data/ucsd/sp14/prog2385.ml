
let t x = x + 1;;

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let carry = match a with | (c,_) -> c in
      match x with
      | (add1,add2) ->
          let newCarry = ((carry + add1) + add2) / 10 in
          let num = ((carry + add1) + add2) mod 10 in
          (match a with | (x,y) -> (newCarry, (num :: y))) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let rec helper (num,carry,rest,l) =
    match rest with
    | [] -> removeZero (carry :: l)
    | h::t ->
        let prod = num * h in
        helper (num, (prod / 10), t, (((carry + prod) mod 10) :: l)) in
  helper (i, 0, l, []);;

let bigMul l1 l2 =
  let f a x =
    let (index,result) = a in
    let (list1,list2) = x in
    match list2 with
    | [] -> []
    | h::t ->
        let resList = mulByDigit h list1 in
        let newIndex = index + 1 in
        let newRes =
          bigAdd result
            (mulByDigit (int_of_float (10.0 ** (float (newIndex - 1))))
               resList) in
        (newIndex, newRes) in
  let base = (0, []) in
  let args = ((List.rev l1), (List.rev l2)) in
  let (_,res) = List.fold_left f base args in res;;
