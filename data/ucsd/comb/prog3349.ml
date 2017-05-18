
let rec clone x n =
  let rec cloneHelper x n ans =
    if n > 0 then cloneHelper x (n - 1) (x :: ans) else ans in
  cloneHelper x n [];;

let padZero l1 l2 =
  let dif = (List.length l1) - (List.length l2) in
  if dif = 0
  then (l1, l2)
  else
    if dif < 0
    then (((clone 0 (0 - dif)) @ l1), l2)
    else (l1, ((clone 0 dif) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,rest) = a in
      let (d1,d2) = x in
      let sum = (d1 + d2) + carry in
      if sum > 9 then (1, ((sum - 10) :: rest)) else (0, (sum :: rest)) in
    let base = (0, []) in
    let args = List.combine (List.rev (0 :: l1)) (List.rev (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let rec mulHelper l' =
    match l' with
    | [] -> (0, [])
    | h::t ->
        let (carry,rest) = mulHelper t in
        let prod = (i * h) + carry in ((prod / 10), ((prod mod 10) :: rest)) in
  let (_,ans) = mulHelper (0 :: l) in removeZero ans;;

let bigMul l1 l2 =
  let f a x =
    let (append,acc) = a in
    ((0 :: append), (bigAdd acc ((mulByDigit x l1) @ append))) in
  let base = ([], []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;

let _ = bigMul [(0, 99)] [];;
