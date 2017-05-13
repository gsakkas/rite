
let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec mulByDigit i l =
  let f a x =
    let mult = i * x in
    match a with
    | h::t -> ((h + mult) / 10) :: ((h + mult) mod 10) :: t
    | _ -> [mult / 10; mult mod 10] in
  let base = [] in removeZero (List.fold_left f base (List.rev l));;

let bigMul l1 l2 =
  let f a x = (List.append ((mulByDigit x l1) (clone 0 (List.length b)))) ::
    b in
  let base = [] in let args = List.rev l2 in List.fold_left f base args;;
