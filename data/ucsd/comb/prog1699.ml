
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | ([],[]) ->
          let (carry,num) = x in
          (0, (if carry > 0 then carry :: num else num))
      | (l1,l2) ->
          (match x with
           | (carry,num) ->
               let addit = ((List.hd l1) + (List.hd l2)) + carry in
               ((if addit > 10 then addit mod 10 else 0), ((addit / 10) ::
                 x))) in
    let base = (0, 0) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;
