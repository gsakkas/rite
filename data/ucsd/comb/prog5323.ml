
let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else h :: t;;

let rec mulByDigit i l =
  let mult (i,l) =
    let f a x =
      match a with
      | (o,l) ->
          let prod = x + o in
          if prod < 10 then (0, (prod :: l)) else (1, ((prod - 10) :: l)) in
    let base = (0, []) in
    let args = l in let (_,res) = List.fold_left f base args in res in
  removeZero (mult (i l));;

let _ = mulByDigit 9 [9; 9; 9; 9];;
