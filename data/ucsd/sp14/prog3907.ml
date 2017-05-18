
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,num) = a in
      let (l1',l2') = x in
      let addit = (l1' + l2') + carry in
      ((addit / 10), ((addit mod 10) :: num)) in
    let base = (0, []) in
    let args = List.combine (List.rev ([0] @ l1)) (List.rev ([0] @ l2)) in
    let (car,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 0
  then []
  else
    if i = 1
    then l
    else
      if (i mod 2) = 0
      then mulByDigit (i / 2) (bigAdd l l)
      else bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    let (place,num) = a in
    let placement =
      ((float_of_int 10) ** (float_of_int place)) |> int_of_float in
    bigAdd a mulByDigit ((x * place) l1) in
  let base = (0, []) in
  let args = l2 in let (_,res) = List.fold_left f base args in res;;
