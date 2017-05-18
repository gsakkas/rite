
let rec helper x = if x = 0 then 1 else 10 * (helper (x - 1));;

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      ((((x1 + x2) + carry) / 10), ((((x1 + x2) + carry) mod 10) :: res)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (carry,res) = List.fold_left f base args in [carry] @ res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let f a x =
    let carry = i * x in
    match a with
    | h::t -> ((h + carry) / 10) :: ((h + carry) mod 10) :: t
    | _ -> [carry / 10; carry mod 10] in
  let base = [] in removeZero (List.fold_left f base (List.rev l));;

let rec tenEx x y =
  match y with | [] -> [] | h::t -> (tenEx (x + 1) t) @ [(helper x) * h];;

let bigMul l1 l2 =
  let f a x = match x with | [] -> [] | h::t -> bigAdd (mulByDigit h l1) a in
  let base = [] in
  let args = tenEx 0 l2 in let res = List.fold_left f base args in res;;
