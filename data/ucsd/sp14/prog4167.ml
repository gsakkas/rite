
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  ((List.append (clone 0 (len2 - len1)) l1),
    (List.append (clone 0 (len1 - len2)) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (i,l) ->
          (match x with
           | (x1,x2) ->
               ((((x1 + x2) + i) / 10), ((((x1 + x2) + i) mod 10) :: l))) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i > 0 then mulByDigit ((i - 1), (bigAdd l l)) else l;;
