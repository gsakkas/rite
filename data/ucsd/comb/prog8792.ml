
let rec mulByDigit i l =
  if i = 0
  then []
  else
    (match 0 :: (List.rev l) with
     | [] -> []
     | h::t ->
         (match t with
          | [] -> [h]
          | x::y ->
              ((mulByDigit i (((i * x) + h) / 10)) :: y) @
                [((i * x) + h) % 10]));;
