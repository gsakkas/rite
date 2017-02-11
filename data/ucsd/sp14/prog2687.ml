
let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        match v with | [] -> [] | h::t -> if h = 0 then acc else 0 :: acc in
      (helper [] mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
        [h * i];;
