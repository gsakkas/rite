
let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | [] -> ([], (snd snd a))
      | h::t -> (t, ((((fst h) + (snd h)) % 10) :: (snd a))) in
    let base = ((List.combine ((rev l1), (rev l2))), []) in
    let args = [] in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;
