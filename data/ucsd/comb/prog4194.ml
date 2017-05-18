
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 < s2
  then (((clone 0 (s2 - s1)) @ l1), l2)
  else if s2 < s1 then (l1, ((clone 0 (s1 - s2)) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h != 0 then h :: t else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (_,[]) -> ((((fst x) + (snd x)) / 10), [((fst x) + (snd x)) mod 10])
      | (c,h::t) ->
          let sum = (c + (fst x)) + (snd x) in
          ((sum / 10), ((sum mod 10) :: (snd a))) in
    let base = (0, []) in
    let args = (List.combine (List.rev l1) (List.rev l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let rec accumulator n ls acc =
    match n with
    | 0 -> [0]
    | 1 -> bigAdd ls acc
    | _ -> accumulator (n - 1) ls (bigAdd ls acc) in
  accumulator i l [0];;

let bigMul l1 l2 =
  let f a x = (((fst a) + 1), (bigAdd x (mulByDigit (fst a) (snd x)))) in
  let base = (0, []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;
