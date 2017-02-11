
let rec palindromeHelper w r =
  match w with
  | [] -> (match r with | [] -> true | _ -> false)
  | x::s ->
      (match r with | y::t -> if x = y then palindromeHelper s t | _ -> false);;
