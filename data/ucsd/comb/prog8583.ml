
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if not (h = 0) then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (b,c) ->
          (match a with
           | (carry,sum) ->
               (match sum with
                | [] ->
                    if ((carry + b) + c) < 10
                    then (0, [carry; (carry + b) + c])
                    else ((carry + 1), [carry + 1; ((carry + b) + c) mod 10])
                | h::t ->
                    if ((b + c) + h) < 10
                    then (0, ([0] @ ([(b + c) + h] @ t)))
                    else
                      ((carry + 1),
                        ([((h + b) + c) / 10] @ ([((h + b) + c) mod 10] @ t))))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 0 -> [0] | 1 -> l | _ -> bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    match x with
    | (b,c) ->
        (match a with
         | (t,product) ->
             ((((b * c) + t) / 10),
               ((bigAdd (mulByDigit c l1)) (product @ [0])))) in
  let base = (0, []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;

let _ = bigMul [9; 9; 9; 9] [9; 9; 9; 9];;
