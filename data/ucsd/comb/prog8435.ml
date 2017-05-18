
let padZero l1 l2 = failwith "to be implemented";;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then padZero (0 :: l1) l2
    else padZero l1 (0 :: l2);;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then padZero (0 :: l1) l2
    else padZero l1 (0 :: l2);;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then padZero (0 :: l1) l2
    else padZero l1 (0 :: l2);;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then padZero (0 :: l1) l2
    else padZero l1 (0 :: l2);;

let rec removeZero l =
  match l with | h::t -> if h = 0 then removeZero t else l | [] -> [];;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let b = (fst x) + (snd x) in
      match a with
      | h::t -> ((h + b) / 10) :: ((h + b) mod 10) :: t
      | [] -> [b / 10; b mod 10] in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

let rec clone x n = if n <= 0 then [] else [x] :: (clone x (n - 1));;

let rec mulByDigit i l =
  let f a x =
    let b = i * x in
    match a with
    | h::t -> ((h + b) / 10) :: ((h + b) mod 10) :: t
    | [] -> [b / 10; b mod 10] in
  let base = [] in removeZero (List.fold_left f base (List.rev l));;

let bigMul l1 l2 =
  let f a x =
    match a with
    | (y,z) -> ((y + 1), (bigAdd ((mulByDigit x l1) @ (clone 0 y)) z)) in
  let base = (0, []) in
  let args = l2 in let (_,res) = List.fold_left f base args in res;;
