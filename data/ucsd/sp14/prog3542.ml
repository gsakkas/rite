
let rec mulByDigit i l =
  let f a x =
    match a with
    | (([],_),acc) -> failwith "should never reach here"
    | ((h::[],r),acc) ->
        let sum = (h * i) + r in
        (([], 0), ((sum / 10) :: (sum mod 10) :: acc))
    | ((h::t,r),acc) ->
        let sum = (h * i) + r in ((t, (sum / 10)), ((sum mod 10) :: acc)) in
  let base = ((List.rev l), 0, []) in
  let args = List.rev l in
  let (_,res) = List.fold_left f base args in
  match res with | 0::t -> t | _ -> res;;
