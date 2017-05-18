
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then (((clone 0 (x2 - x1)) @ l1), l2)
  else (l1, ((clone 0 (x1 - x2)) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::[] -> if h <> 0 then l else []
  | h::t -> if h <> 0 then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      match x2 with
      | h::t ->
          let (carry,res) = a in
          let tens = ((x1 + x2) + h) / 10 in
          let ones = ((x1 + x2) + h) mod 10 in
          ((tens :: carry), (ones :: res))
      | [] ->
          let (carry,res) = a in
          let tens = ((x1 + x2) + h) / 10 in
          let ones = ((x1 + x2) + h) mod 10 in tens :: ones :: res in
    let base = ([0], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;
